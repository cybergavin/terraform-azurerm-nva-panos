#
# Local variables
#
locals {
    # Flattened list of network interfaces for all PANs
    pan-nics = flatten([
      for pan-instance in range(1,var.nva-pan.spec.count+1) : [
        for nic in range(length(var.nva-pan.spec.nic-aliases)) : {
          pan-name        = format("%s-nva-pan-%02d-%s",var.tenant,pan-instance,var.platform)
          nic-name        = format("%s-nic-pan-%02d-%s-%s",var.tenant,pan-instance,var.nva-pan.spec.nic-aliases[nic],var.platform)
          nic-alias       = var.nva-pan.spec.nic-aliases[nic]
          nic-subnet      = format("%s-snet-pan-%s-%s",var.tenant,var.nva-pan.spec.nic-aliases[nic],var.platform)
          nic-index       = pan-instance + 3
          pan-index       = pan-instance
        }
      ]
    ])
    # List of PANs to be deployed
    pan-vms = [
      for pan-instance in range(1,var.nva-pan.spec.count+1) : {
          pan-name        = format("%s-nva-pan-%02d-%s",var.tenant,pan-instance,var.platform)
          pan-index       = pan-instance - 1
      }
    ]
    # Availability Zones
    avail-zones = [1,2,3]
}
#############################################################################################################
#
# PAN VM-Series Firewalls
#
#############################################################################################################
#
# Create PAN Network Interfaces
#
resource "azurerm_network_interface" "pan-nic" {
  for_each = {
    for pan in local.pan-nics : pan.nic-name => pan
  }

    name                 = each.key
    location             = var.region
    resource_group_name  = var.rg-name
    enable_ip_forwarding = true

    ip_configuration {
      name                          = format("%s-%02d",each.key,1)
      subnet_id                     = var.snets[each.value.nic-subnet].id
      private_ip_address_allocation = "Static"
      private_ip_address            = cidrhost(var.snets[each.value.nic-subnet].address_prefixes[0],each.value.nic-index)
    }
}
#
# Create PAN VM-Series firewalls
#
resource "azurerm_linux_virtual_machine" "pan" {
  for_each = {
    for pan in local.pan-vms : pan.pan-name => pan
  } 

    name                            = each.key
    resource_group_name             = var.rg-name
    location                        = var.region
    zone                            = element(local.avail-zones,each.value.pan-index%length(local.avail-zones))
    size                            = var.nva-pan.spec.vm-size
    admin_username                  = var.nva-pan.spec.admin_username
    admin_password                  = var.nva-pan.spec.admin_password
    tags                            = lookup(var.nva-pan, "tags", null) == null ? var.global-tags : merge(var.global-tags, var.nva-pan.tags)  
    disable_password_authentication = false
    network_interface_ids           = [
      azurerm_network_interface.pan-nic[format("%s-nic-pan-%02d-management-%s",var.tenant,each.value.pan-index+1,var.platform)].id,
      azurerm_network_interface.pan-nic[format("%s-nic-pan-%02d-internet-%s",var.tenant,each.value.pan-index+1,var.platform)].id,
      azurerm_network_interface.pan-nic[format("%s-nic-pan-%02d-internal-%s",var.tenant,each.value.pan-index+1,var.platform)].id
                                      ]
    os_disk {
      caching              = "ReadWrite"
      storage_account_type = "StandardSSD_LRS"
    }
    source_image_reference {
      publisher = "paloaltonetworks"
      offer     = "vmseries-flex"
      sku       = "byol"
      version   = var.nva-pan.spec.version
    }
    plan {
      name      = "byol"
      product   = "vmseries-flex"
      publisher = "paloaltonetworks"
    }
    depends_on = [
      azurerm_marketplace_agreement.pan
    ]
}
#
# Accept the Marketplace License agreement
#
resource "azurerm_marketplace_agreement" "pan" {
  publisher = "paloaltonetworks"
  offer     = "vmseries-flex"
  plan      = "byol"
}