resource "dynatrace_eula_settings" "this" {
  for_each = {
    for r in var.resources : r.name => r
    if r.type == "eula_settings" && r.settings.eula_settings != null
  }

  scope       = each.value.settings.eula_settings.scope
  enable_eula = each.value.settings.eula_settings.enable_eula
}