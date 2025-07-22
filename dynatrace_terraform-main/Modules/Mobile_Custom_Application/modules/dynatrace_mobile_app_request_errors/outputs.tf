output "mobile_app_request_error_scopes" {
  value = { for k, v in dynatrace_mobile_app_request_errors.this : k => v.scope }
}
