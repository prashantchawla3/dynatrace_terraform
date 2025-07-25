module "failure_detection_parameters" {
  source = "./modules/dynatrace_failure_detection_parameters"

  failure_detection_parameters_enabled           = var.failure_detection_parameters_enabled
  failure_detection_parameters_name              = var.failure_detection_parameters_name
  failure_detection_parameters_description       = var.failure_detection_parameters_description
  http_404_not_found_failures                    = var.http_404_not_found_failures
  ignore_all_exceptions                          = var.ignore_all_exceptions
  ignore_span_failure_detection                  = var.ignore_span_failure_detection
  custom_error_rules                             = var.custom_error_rules
  custom_handled_exceptions                      = var.custom_handled_exceptions
  ignored_exceptions                             = var.ignored_exceptions
  success_forcing_exceptions                     = var.success_forcing_exceptions
  client_side_errors                             = var.client_side_errors
  server_side_errors                             = var.server_side_errors
  fail_on_missing_response_code_client_side      = var.fail_on_missing_response_code_client_side
  fail_on_missing_response_code_server_side      = var.fail_on_missing_response_code_server_side
  existing_failure_detection_parameters_name     = var.existing_failure_detection_parameters_name
}

module "failure_detection_rules" {
  source = "./modules/dynatrace_failure_detection_rules"

  failure_detection_rules_enabled = var.failure_detection_rules_enabled
  failure_detection_rules_name    = var.failure_detection_rules_name
  failure_conditions              = var.failure_conditions
}

module "service_failure_toggle" {
  source = "./modules/dynatrace_service_failure"

  service_failure_enabled = var.service_failure_enabled
  service_id              = var.service_id
}

module "service_http_failure" {
  source = "./modules/dynatrace_service_http_failure"

  service_http_failure_enabled = var.service_http_failure_enabled
  broken_link_domains          = var.broken_link_domains
  service_id                   = var.service_id
}
