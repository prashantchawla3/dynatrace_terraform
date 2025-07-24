output "oneagent_default_modes" {
  value = [
    for r in var.oneagent_default_mode_resources : r.settings.oneagent_default_mode.default_mode
  ]
}
