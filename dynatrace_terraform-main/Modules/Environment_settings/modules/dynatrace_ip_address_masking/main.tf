resource "dynatrace_ip_address_masking" "this" {
  for_each = {
    for r in var.resources : r.name => r
    if r.type == "ip_address_masking" && r.settings.ip_address_masking != null
  }

  scope   = each.value.settings.ip_address_masking.scope
  enabled = each.value.settings.ip_address_masking.enabled
  type    = each.value.settings.ip_address_masking.type
}
