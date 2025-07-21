
module "existing_failure_detection_parameters_name" {
  source = "./modules/dynatrace_failure_detection_parameters"
  existing_failure_detection_parameters_name = var.existing_failure_detection_parameters_name
}

module "failure_detection_parameters_enabled" {
  source = "./modules/dynatrace_failure_detection_parameters"
  failure_detection_parameters_enabled = var.failure_detection_parameters_enabled
}

module "failure_detection_parameters_name" {
  source = "./modules/dynatrace_failure_detection_parameters"
  failure_detection_parameters_name = var.failure_detection_parameters_name
}

module "failure_detection_parameters_description" {
  source = "./modules/dynatrace_failure_detection_parameters"
  failure_detection_parameters_description = var.failure_detection_parameters_description
}

module "http_404_not_found_failures" {
  source = "./modules/http_404_not_found_failures"
  http_404_not_found_failures = var.http_404_not_found_failures
}

module "ignore_all_exceptions" {
  source = "./modules/ignore_all_exceptions"
  ignore_all_exceptions = var.ignore_all_exceptions
}

module "ignore_span_failure_detection" {
  source = "./modules/ignore_span_failure_detection"
  ignore_span_failure_detection = var.ignore_span_failure_detection
}

module "custom_error_rules" {
  source = "./modules/custom_error_rules"
  custom_error_rules = var.custom_error_rules
}

module "custom_handled_exceptions" {
  source = "./modules/custom_handled_exceptions"
  custom_handled_exceptions = var.custom_handled_exceptions
}

module "ignored_exceptions" {
  source = "./modules/ignored_exceptions"
  ignored_exceptions = var.ignored_exceptions
}

module "success_forcing_exceptions" {
  source = "./modules/success_forcing_exceptions"
  success_forcing_exceptions = var.success_forcing_exceptions
}

module "client_side_errors" {
  source = "./modules/client_side_errors"
  client_side_errors = var.client_side_errors
}

module "server_side_errors" {
  source = "./modules/server_side_errors"
  server_side_errors = var.server_side_errors
}

module "fail_on_missing_response_code_client_side" {
  source = "./modules/fail_on_missing_response_code_client_side"
  fail_on_missing_response_code_client_side = var.fail_on_missing_response_code_client_side
}

module "fail_on_missing_response_code_server_side" {
  source = "./modules/fail_on_missing_response_code_server_side"
  fail_on_missing_response_code_server_side = var.fail_on_missing_response_code_server_side
}

module "failure_detection_rules_enabled" {
  source = "./modules/dynatrace_failure_detection_rules"
  failure_detection_rules_enabled = var.failure_detection_rules_enabled
}

module "failure_detection_rules_name" {
  source = "./modules/dynatrace_failure_detection_rules"
  failure_detection_rules_name = var.failure_detection_rules_name
}

module "failure_conditions" {
  source = "./modules/failure_conditions"
  failure_conditions = var.failure_conditions
}

module "service_failure_enabled" {
  source = "./modules/dynatrace_service_failure"
  service_failure_enabled = var.service_failure_enabled
}

module "service_http_failure_enabled" {
  source = "./modules/dynatrace_service_http_failure"
  service_http_failure_enabled = var.service_http_failure_enabled
}

module "service_id" {
  source = "./modules/service_id"
  service_id = var.service_id
}

module "broken_link_domains" {
  source = "./modules/broken_link_domains"
  broken_link_domains = var.broken_link_domains
}
