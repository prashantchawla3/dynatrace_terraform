resource "dynatrace_hub_permissions" "this" {
  for_each = {
    for r in var.hub_permissions_resources : r.name => r
    if r.settings.hub_permissions != null
  }

  email       = each.value.settings.hub_permissions.email
  description = each.value.settings.hub_permissions.description
}
