
output "eula_settings" {
  value = [
    for r in var.eula_settings_resources : {
      scope       = r.settings.eula_settings.scope
      enable_eula = r.settings.eula_settings.enable_eula
    }
  ]
}
