terraform {
  required_version = ">= 0.15"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.58.0"
    }
  }
}
provider "azurerm" {
  features {}
}
#
# Create resource group
#
resource azurerm_resource_group "rg" {
  name      = "network-rg"
  location  = var.region
}
#
# Create VNet
#
resource "azurerm_virtual_network" "vnet" {
  name                = "network-hub"
  address_space       = var.vnet-address-space
  location            = var.region
  resource_group_name = azurerm_resource_group.rg.name
}
#
# Create Subnets for PAN NICs
#
locals {
  snet-map = {for k, v in var.subnets : format("%s-snet-pan-%s-%s",var.tenant,k,var.platform) => v}
}
resource "azurerm_subnet" "snets" {
  for_each = local.snet-map

    name                  = each.key
    resource_group_name   = azurerm_resource_group.rg.name
    virtual_network_name  = azurerm_virtual_network.vnet.name
    address_prefixes      = [format("%s",each.value)]
}
#
# Create PAN(s)
#
module "pan" {
  source          = "cybergavin/nva-panos/azurerm"
  version         = "1.0.0"
  nva-pan         = var.nva-pan
  tenant          = var.tenant
  region          = var.region
  global-tags     = var.global-tags
  platform        = var.platform
  rg-name         = azurerm_resource_group.rg.name
  snets           = azurerm_subnet.snets
  vnet-id         = azurerm_virtual_network.vnet.id
}