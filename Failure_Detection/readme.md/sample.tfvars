# Data source input
existing_failure_detection_parameters_name = "Terraform Example"

# Resource toggles
failure_detection_parameters_enabled = true
failure_detection_rules_enabled      = true
service_failure_enabled              = true
service_http_failure_enabled         = true

# Common values
failure_detection_parameters_name        = "example-param"
failure_detection_parameters_description = "Created by Terraform"
http_404_not_found_failures              = false
ignore_all_exceptions                    = false
ignore_span_failure_detection            = true

# Error rules
custom_error_rules = [
  {
    request_attribute      = "attr-id"
    compare_operation_type = "STRING_EXISTS"
  }
]

custom_handled_exceptions = [
  {
    class_pattern   = "ClassPattern"
    message_pattern = "ExceptionPattern"
  }
]

ignored_exceptions = [
  {
    class_pattern   = "ClassPattern"
    message_pattern = "ExceptionPattern"
  }
]

success_forcing_exceptions = [
  {
    class_pattern   = "ClassPattern"
    message_pattern = "ExceptionPattern"
  }
]

# HTTP response codes
client_side_errors                        = "400-599"
server_side_errors                        = "500-599"
fail_on_missing_response_code_client_side = false
fail_on_missing_response_code_server_side = true

# Failure detection rules
failure_detection_rules_name = "example-rule"
failure_conditions = [
  {
    attribute      = "SERVICE_NAME"
    case_sensitive = true
    predicate_type = "STRING_EQUALS"
    text_values    = ["Terraform"]
  }
]

# Service failure
service_id = "SERVICE-EXAMPLE-ID"

# HTTP failure
broken_link_domains = ["www.google.com"]
