resource "dynatrace_eula_settings" "this" {
  for_each = {
    for r in var.eula_settings_resources : r.name => r
    if r.settings.eula_settings != null
  }

  scope       = each.value.settings.eula_settings.scope
  enable_eula = each.value.settings.eula_settings.enable_eula
}
