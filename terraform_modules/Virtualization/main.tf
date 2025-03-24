resource "dynatrace_vmware" "example" {
  enabled   = var.enabled
  ipaddress = var.ipaddress
  label     = var.label
  password  = var.password
  username  = var.username
  filter    = var.filter
}