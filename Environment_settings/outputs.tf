output "cloud_development_environments" {
  value = [
    for r in var.resources : try(r.settings.cloud_development_environments, null)
    if r.type == "cloud_development_environments"
  ]
}

output "disk_exclusions" {
  value = [
    for r in var.resources : try(r.settings.disk_options.exclusions, null)
    if r.type == "disk_options"
  ]
}

output "hub_permissions_email" {
  value = [
    for r in var.resources : try(r.settings.hub_permissions.email, null)
    if r.type == "hub_permissions"
  ]
}

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
