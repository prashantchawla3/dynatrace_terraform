resource "dynatrace_failure_detection_parameters" "this" {
  count       = var.failure_detection_parameters_enabled ? 1 : 0
  name        = var.failure_detection_parameters_name
  description = var.failure_detection_parameters_description

  broken_links {
    http_404_not_found_failures = var.http_404_not_found_failures
  }

  exception_rules {
    ignore_all_exceptions         = var.ignore_all_exceptions
    ignore_span_failure_detection = var.ignore_span_failure_detection

    dynamic "custom_error_rules" {
      for_each = var.custom_error_rules
      content {
        custom_error_rule {
          request_attribute = custom_error_rules.value.request_attribute
          condition {
            compare_operation_type = custom_error_rules.value.compare_operation_type
          }
        }
      }
    }

    dynamic "custom_handled_exceptions" {
      for_each = var.custom_handled_exceptions
      content {
        custom_handled_exception {
          class_pattern   = custom_handled_exceptions.value.class_pattern
          message_pattern = custom_handled_exceptions.value.message_pattern
        }
      }
    }

    dynamic "ignored_exceptions" {
      for_each = var.ignored_exceptions
      content {
        custom_handled_exception {
          class_pattern   = ignored_exceptions.value.class_pattern
          message_pattern = ignored_exceptions.value.message_pattern
        }
      }
    }

    dynamic "success_forcing_exceptions" {
      for_each = var.success_forcing_exceptions
      content {
        custom_handled_exception {
          class_pattern   = success_forcing_exceptions.value.class_pattern
          message_pattern = success_forcing_exceptions.value.message_pattern
        }
      }
    }
  }

  http_response_codes {
    client_side_errors                        = var.client_side_errors
    fail_on_missing_response_code_client_side = var.fail_on_missing_response_code_client_side
    fail_on_missing_response_code_server_side = var.fail_on_missing_response_code_server_side
    server_side_errors                        = var.server_side_errors
  }
}
