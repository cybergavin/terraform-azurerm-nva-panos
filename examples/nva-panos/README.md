Refer the example source code in GitHub. The Terraform plan generated for the example (creating 2 PAN NVAs) is given below

### terraform.plan
```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.rg will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "canadacentral"
      + name     = "network-rg"
    }

  # azurerm_subnet.snets["cg-snet-pan-internal-qa-cc"] will be created
  + resource "azurerm_subnet" "snets" {
      + address_prefix                                 = (known after apply)
      + address_prefixes                               = [
          + "10.100.100.64/27",
        ]
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "cg-snet-pan-internal-qa-cc"
      + resource_group_name                            = "network-rg"
      + virtual_network_name                           = "network-hub"
    }

  # azurerm_subnet.snets["cg-snet-pan-internet-qa-cc"] will be created
  + resource "azurerm_subnet" "snets" {
      + address_prefix                                 = (known after apply)
      + address_prefixes                               = [
          + "10.100.100.32/27",
        ]
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "cg-snet-pan-internet-qa-cc"
      + resource_group_name                            = "network-rg"
      + virtual_network_name                           = "network-hub"
    }

  # azurerm_subnet.snets["cg-snet-pan-management-qa-cc"] will be created
  + resource "azurerm_subnet" "snets" {
      + address_prefix                                 = (known after apply)
      + address_prefixes                               = [
          + "10.100.100.0/27",
        ]
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "cg-snet-pan-management-qa-cc"
      + resource_group_name                            = "network-rg"
      + virtual_network_name                           = "network-hub"
    }

  # azurerm_virtual_network.vnet will be created
  + resource "azurerm_virtual_network" "vnet" {
      + address_space         = [
          + "10.100.100.0/24",
        ]
      + dns_servers           = (known after apply)
      + guid                  = (known after apply)
      + id                    = (known after apply)
      + location              = "canadacentral"
      + name                  = "network-hub"
      + resource_group_name   = "network-rg"
      + subnet                = (known after apply)
      + vm_protection_enabled = false
    }

  # module.pan.azurerm_linux_virtual_machine.pan["cg-nva-pan-01-qa-cc"] will be created
  + resource "azurerm_linux_virtual_machine" "pan" {
      + admin_password                  = (sensitive value)
      + admin_username                  = "panadmin"
      + allow_extension_operations      = true
      + computer_name                   = (known after apply)
      + disable_password_authentication = false
      + extensions_time_budget          = "PT1H30M"
      + id                              = (known after apply)
      + location                        = "canadacentral"
      + max_bid_price                   = -1
      + name                            = "cg-nva-pan-01-qa-cc"
      + network_interface_ids           = (known after apply)
      + platform_fault_domain           = -1
      + priority                        = "Regular"
      + private_ip_address              = (known after apply)
      + private_ip_addresses            = (known after apply)
      + provision_vm_agent              = true
      + public_ip_address               = (known after apply)
      + public_ip_addresses             = (known after apply)
      + resource_group_name             = "network-rg"
      + size                            = "Standard_DS3_v2"
      + tags                            = {
          + "Description" = "PAN Firewall"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "cg@contoso.com"
        }
      + virtual_machine_id              = (known after apply)
      + zone                            = "1"

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = (known after apply)
          + storage_account_type      = "StandardSSD_LRS"
          + write_accelerator_enabled = false
        }

      + plan {
          + name      = "byol"
          + product   = "vmseries-flex"
          + publisher = "paloaltonetworks"
        }

      + source_image_reference {
          + offer     = "vmseries-flex"
          + publisher = "paloaltonetworks"
          + sku       = "byol"
          + version   = "9.1.10"
        }
    }

  # module.pan.azurerm_linux_virtual_machine.pan["cg-nva-pan-02-qa-cc"] will be created
  + resource "azurerm_linux_virtual_machine" "pan" {
      + admin_password                  = (sensitive value)
      + admin_username                  = "panadmin"
      + allow_extension_operations      = true
      + computer_name                   = (known after apply)
      + disable_password_authentication = false
      + extensions_time_budget          = "PT1H30M"
      + id                              = (known after apply)
      + location                        = "canadacentral"
      + max_bid_price                   = -1
      + name                            = "cg-nva-pan-02-qa-cc"
      + network_interface_ids           = (known after apply)
      + platform_fault_domain           = -1
      + priority                        = "Regular"
      + private_ip_address              = (known after apply)
      + private_ip_addresses            = (known after apply)
      + provision_vm_agent              = true
      + public_ip_address               = (known after apply)
      + public_ip_addresses             = (known after apply)
      + resource_group_name             = "network-rg"
      + size                            = "Standard_DS3_v2"
      + tags                            = {
          + "Description" = "PAN Firewall"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "cg@contoso.com"
        }
      + virtual_machine_id              = (known after apply)
      + zone                            = "2"

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = (known after apply)
          + storage_account_type      = "StandardSSD_LRS"
          + write_accelerator_enabled = false
        }

      + plan {
          + name      = "byol"
          + product   = "vmseries-flex"
          + publisher = "paloaltonetworks"
        }

      + source_image_reference {
          + offer     = "vmseries-flex"
          + publisher = "paloaltonetworks"
          + sku       = "byol"
          + version   = "9.1.10"
        }
    }

  # module.pan.azurerm_marketplace_agreement.pan will be created
  + resource "azurerm_marketplace_agreement" "pan" {
      + id                  = (known after apply)
      + license_text_link   = (known after apply)
      + offer               = "vmseries-flex"
      + plan                = "byol"
      + privacy_policy_link = (known after apply)
      + publisher           = "paloaltonetworks"
    }

  # module.pan.azurerm_network_interface.pan-nic["cg-nic-pan-01-internal-qa-cc"] will be created
  + resource "azurerm_network_interface" "pan-nic" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = true
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "canadacentral"
      + mac_address                   = (known after apply)
      + name                          = "cg-nic-pan-01-internal-qa-cc"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "network-rg"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + name                          = "cg-nic-pan-01-internal-qa-cc-01"
          + primary                       = (known after apply)
          + private_ip_address            = "10.100.100.68"
          + private_ip_address_allocation = "static"
          + private_ip_address_version    = "IPv4"
          + subnet_id                     = (known after apply)
        }
    }

  # module.pan.azurerm_network_interface.pan-nic["cg-nic-pan-01-internet-qa-cc"] will be created
  + resource "azurerm_network_interface" "pan-nic" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = true
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "canadacentral"
      + mac_address                   = (known after apply)
      + name                          = "cg-nic-pan-01-internet-qa-cc"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "network-rg"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + name                          = "cg-nic-pan-01-internet-qa-cc-01"
          + primary                       = (known after apply)
          + private_ip_address            = "10.100.100.36"
          + private_ip_address_allocation = "static"
          + private_ip_address_version    = "IPv4"
          + subnet_id                     = (known after apply)
        }
    }

  # module.pan.azurerm_network_interface.pan-nic["cg-nic-pan-01-management-qa-cc"] will be created
  + resource "azurerm_network_interface" "pan-nic" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = true
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "canadacentral"
      + mac_address                   = (known after apply)
      + name                          = "cg-nic-pan-01-management-qa-cc"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "network-rg"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + name                          = "cg-nic-pan-01-management-qa-cc-01"
          + primary                       = (known after apply)
          + private_ip_address            = "10.100.100.4"
          + private_ip_address_allocation = "static"
          + private_ip_address_version    = "IPv4"
          + subnet_id                     = (known after apply)
        }
    }

  # module.pan.azurerm_network_interface.pan-nic["cg-nic-pan-02-internal-qa-cc"] will be created
  + resource "azurerm_network_interface" "pan-nic" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = true
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "canadacentral"
      + mac_address                   = (known after apply)
      + name                          = "cg-nic-pan-02-internal-qa-cc"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "network-rg"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + name                          = "cg-nic-pan-02-internal-qa-cc-01"
          + primary                       = (known after apply)
          + private_ip_address            = "10.100.100.69"
          + private_ip_address_allocation = "static"
          + private_ip_address_version    = "IPv4"
          + subnet_id                     = (known after apply)
        }
    }

  # module.pan.azurerm_network_interface.pan-nic["cg-nic-pan-02-internet-qa-cc"] will be created
  + resource "azurerm_network_interface" "pan-nic" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = true
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "canadacentral"
      + mac_address                   = (known after apply)
      + name                          = "cg-nic-pan-02-internet-qa-cc"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "network-rg"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + name                          = "cg-nic-pan-02-internet-qa-cc-01"
          + primary                       = (known after apply)
          + private_ip_address            = "10.100.100.37"
          + private_ip_address_allocation = "static"
          + private_ip_address_version    = "IPv4"
          + subnet_id                     = (known after apply)
        }
    }

  # module.pan.azurerm_network_interface.pan-nic["cg-nic-pan-02-management-qa-cc"] will be created
  + resource "azurerm_network_interface" "pan-nic" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = true
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "canadacentral"
      + mac_address                   = (known after apply)
      + name                          = "cg-nic-pan-02-management-qa-cc"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "network-rg"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + name                          = "cg-nic-pan-02-management-qa-cc-01"
          + primary                       = (known after apply)
          + private_ip_address            = "10.100.100.5"
          + private_ip_address_allocation = "static"
          + private_ip_address_version    = "IPv4"
          + subnet_id                     = (known after apply)
        }
    }

Plan: 14 to add, 0 to change, 0 to destroy.
```