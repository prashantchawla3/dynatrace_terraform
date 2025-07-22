output "attack_settings_enabled" {
  value = [for s in dynatrace_attack_settings.settings : s.enabled]
}