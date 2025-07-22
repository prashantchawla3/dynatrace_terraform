resource "dynatrace_service_failure" "this" {
  count      = var.service_failure_enabled ? 1 : 0
  enabled    = var.service_failure_enabled
  service_id = var.service_id

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
            case_sensitive         = custom_error_rules.value.case_sensitive
            text_value             = custom_error_rules.value.text_value
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
}
