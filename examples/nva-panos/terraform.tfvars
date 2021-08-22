# Global tags
global-tags = {
  "ManagedBy" = "Terraform"
}
# Region for deployment - Must support availability zones
region        = "canadacentral"
platform      = "qa-cc"
# Tenant
tenant = "ia"
#
# VNet
#
vnet-address-space = ["10.100.100.0/24"]
#
# Map of subnets
#
subnets = {
  management = "10.100.100.0/27"
  internet = "10.100.100.32/27"
  internal = "10.100.100.64/27"
}
#
# Map of NVA PAN
#
nva-pan = {
  spec = {
    count             =  "2"
    vm-size           = "Standard_DS3_v2"
    admin_username    = "panadmin"
    admin_password    = "9Ygs@$fd*#f142HX"
    version           = "9.1.10"
    nic-aliases       = ["management", "internet","internal"]}
  tags                = {
    Owner             = "ia@contoso.com",
    Description       = "PAN Firewall" }
}