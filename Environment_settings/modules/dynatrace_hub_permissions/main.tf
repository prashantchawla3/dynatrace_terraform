resource "dynatrace_hub_permissions" "this" {
  for_each = {
    for r in var.resources : r.name => r
    if r.type == "hub_permissions" && r.settings.hub_permissions != null
  }

  email       = each.value.settings.hub_permissions.email
  description = each.value.settings.hub_permissions.description
}
