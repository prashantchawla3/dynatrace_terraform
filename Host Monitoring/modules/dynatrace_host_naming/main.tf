resource "dynatrace_host_naming" "example" {
  count   = length(var.host_naming)
  enabled = var.host_naming[count.index].enabled
  format  = var.host_naming[count.index].format
  name    = var.host_naming[count.index].name
}
resource "dynatrace_host_naming_order" "example" {
  count           = length(dynatrace_host_naming.example)
  naming_rule_ids = [dynatrace_host_naming.example[count.index].id]
}
