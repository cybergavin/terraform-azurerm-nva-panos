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
variable "vnet-address-space" {
  type        = list
  description = "(Required) VNet address space"
}
variable "nva-pan" {
  type        = any
  description = "(Required) Map of the Palo Alto Networks VM-Series NVA to be deployed"
}
variable "subnets" {
  type        = map(any)
  description = "(Required) Map of subnets containing NVA nics"
}