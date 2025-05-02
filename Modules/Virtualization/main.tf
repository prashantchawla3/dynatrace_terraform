resource "dynatrace_vmware" "this" {
  for_each = var.vmware_configs

  enabled   = each.value.enabled
  ipaddress = each.value.ipaddress
  label     = each.value.label
  password  = each.value.password
  username  = each.value.username
  filter    = each.value.filter
}
