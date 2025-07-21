output "custom_app_enablement_scopes" {
  value = { for k, v in dynatrace_custom_app_enablement.this : k => v.scope }
}
