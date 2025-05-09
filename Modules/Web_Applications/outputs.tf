output "dynatrace_application_detection_rule_v2_ids" {
  value = [for rule in dynatrace_application_detection_rule_v2.app_detection_rule : rule.id]
}

output "dynatrace_web_app_custom_config_properties_ids" {
  value = [for prop in dynatrace_web_app_custom_config_properties.custom_config_properties : prop.id]
}

output "dynatrace_application_error_rules_ids" {
  value = [for rule in dynatrace_application_error_rules.app_error_rules : rule.id]
}

output "dynatrace_calculated_web_metric_ids" {
  value = [for metric in dynatrace_calculated_web_metric.calculated_web_metric : metric.id]
}

output "dynatrace_key_user_action_ids" {
  value = [for action in dynatrace_key_user_action.key_user_action : action.id]
}

output "dynatrace_web_app_auto_injection_ids" {
  value = [for injection in dynatrace_web_app_auto_injection.web_app_auto_injection : injection.id]
}

output "dynatrace_web_app_beacon_endpoint_ids" {
  value = [for endpoint in dynatrace_web_app_beacon_endpoint.web_app_beacon_endpoint : endpoint.id]
}

output "dynatrace_web_app_beacon_origins_ids" {
  value = [for origin in dynatrace_web_app_beacon_origins.web_app_beacon_origins : origin.id]
}

output "dynatrace_web_app_custom_errors_ids" {
  value = [for error in dynatrace_web_app_custom_errors.web_app_custom_errors : error.id]
}

output "dynatrace_web_app_custom_injection_ids" {
  value = [for injection in dynatrace_web_app_custom_injection.web_app_custom_injection : injection.id]
}

output "dynatrace_web_app_enablement_ids" {
  value = [for enablement in dynatrace_web_app_enablement.web_app_enablement : enablement.id]
}

output "dynatrace_web_app_injection_cookie_ids" {
  value = [for cookie in dynatrace_web_app_injection_cookie.web_app_injection_cookie : cookie.id]
}

output "dynatrace_web_app_key_performance_custom_ids" {
  value = [for custom in dynatrace_web_app_key_performance_custom.web_app_key_performance_custom : custom.id]
}

output "dynatrace_web_app_key_performance_load_ids" {
  value = [for load in dynatrace_web_app_key_performance_load.web_app_key_performance_load : load.id]
}

output "dynatrace_web_app_key_performance_xhr_ids" {
  value = [for xhr in dynatrace_web_app_key_performance_xhr.web_app_key_performance_xhr : xhr.id]
}

output "dynatrace_web_app_request_errors_ids" {
  value = [for error in dynatrace_web_app_request_errors.web_app_request_errors : error.id]
}

output "dynatrace_web_app_resource_cleanup_ids" {
  value = [for cleanup in dynatrace_web_app_resource_cleanup.web_app_resource_cleanup : cleanup.id]
}


