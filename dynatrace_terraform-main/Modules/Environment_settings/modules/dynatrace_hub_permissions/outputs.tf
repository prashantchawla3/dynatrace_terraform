output "hub_permissions_info" {
  value = [
    for r in var.hub_permissions_resources : {
      email       = r.settings.hub_permissions.email
      description = r.settings.hub_permissions.description
    }
  ]
}