variable "tenant" {
  type        = string
  description = "(Required) Tenant name"
}
variable "region" {
  type        = string
  description = "(Required) Location name"
}
variable "platform" {
  type        = string
  description = "(Required) Platform => e.g. environment-region => qa-cc"
  default = "az"
}
variable "global-tags" {
  type        = map(any)
  description = "(Optional) Map of tags to be applied globally on all Azure resources deployed via Terraform"
  default     = {}
}
variable "vnet-id" {
  type        = string
  description = "(Required) Output of azurerm_virtual_network for VNet containing NVAs and Loadbalancer"
}
variable "snets" {
  type        = map(any)
  description = "(Required) Output map of azurerm_subnet for subnets containing NVA nics"
}
variable "rg-name" {
  type        = string
  description = "(Required) Output of azurerm_resource_group  for resource group containing NVAs and LoadBalancer"
}
variable "nva-pan" {
  type        = any
  description = "(Required) Map of the Palo Alto Networks VM-Series NVA to be deployed"
}