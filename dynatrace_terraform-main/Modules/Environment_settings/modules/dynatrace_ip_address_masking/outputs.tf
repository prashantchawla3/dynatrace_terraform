output "ip_masking_config" {
  value = [
    for r in var.ip_masking_resources : {
      scope   = r.settings.ip_address_masking.scope
      enabled = r.settings.ip_address_masking.enabled
      type    = r.settings.ip_address_masking.type
    }
  ]
}