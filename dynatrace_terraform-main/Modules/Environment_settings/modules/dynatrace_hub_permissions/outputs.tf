output "hub_permissions_email" {
  value = [
    for r in var.resources : try(r.settings.hub_permissions.email, null)
    if r.type == "hub_permissions"
  ]
}