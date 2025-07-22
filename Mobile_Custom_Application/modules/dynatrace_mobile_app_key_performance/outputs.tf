output "mobile_app_key_performance_scopes" {
  value = { for k, v in dynatrace_mobile_app_key_performance.this : k => v.scope }
}
