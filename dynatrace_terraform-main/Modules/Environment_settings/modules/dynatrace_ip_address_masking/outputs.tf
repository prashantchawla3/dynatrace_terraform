output "ip_masking_status" {
  value = [
    for r in var.resources : {
      scope   = try(r.settings.ip_address_masking.scope, null)
      enabled = try(r.settings.ip_address_masking.enabled, null)
      type    = try(r.settings.ip_address_masking.type, null)
    }
    if r.type == "ip_address_masking"
  ]
}