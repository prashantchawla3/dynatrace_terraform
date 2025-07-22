output "calculated_mobile_metric_ids" {
  value = { for k, v in dynatrace_calculated_mobile_metric.this : k => v.id }
}

output "custom_app_enablement_scopes" {
  value = { for k, v in dynatrace_custom_app_enablement.this : k => v.scope }
}

output "mobile_app_enablement_status" {
  value = { for k, v in dynatrace_mobile_app_enablement.this : k => v.rum[0].enabled }
}

output "mobile_app_key_performance_scopes" {
  value = { for k, v in dynatrace_mobile_app_key_performance.this : k => v.scope }
}

output "mobile_app_request_error_scopes" {
  value = { for k, v in dynatrace_mobile_app_request_errors.this : k => v.scope }
}

output "mobile_application_names" {
  value = { for k, v in dynatrace_mobile_application.this : k => v.name }
}
