output "user_settings_ids" {
  description = "Map of created user settings resource IDs"
  value = { for k, v in dynatrace_user_settings.this : k => v.id }
}
