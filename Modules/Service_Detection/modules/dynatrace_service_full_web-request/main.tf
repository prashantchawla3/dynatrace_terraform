resource "dynatrace_service_full_web_request" "this" {
  count            = length(var.full_web_requests)
  name             = var.full_web_requests[count.index].name
  enabled          = var.full_web_requests[count.index].enabled
  description      = "Created by Terraform"
  management_zones = [var.full_web_requests[count.index].management_zone]

  dynamic "conditions" {
    for_each = var.full_web_requests[count.index].conditions
    content {
      condition {
        attribute              = conditions.value.attribute
        compare_operation_type = conditions.value.compare_operation_type
        ignore_case            = conditions.value.ignore_case
        text_values            = conditions.value.text_values
      }
    }
  }

  id_contributors {
    application_id {
      enable_id_contributor = var.full_web_requests[count.index].id_contributors.application_id.enable_id_contributor
      service_id_contributor {
        contribution_type = var.full_web_requests[count.index].id_contributors.application_id.contribution_type
        value_override {
          value = var.full_web_requests[count.index].id_contributors.application_id.value_override
        }
      }
    }

    context_root {
      enable_id_contributor = var.full_web_requests[count.index].id_contributors.context_root.enable_id_contributor
      service_id_contributor {
        contribution_type = var.full_web_requests[count.index].id_contributors.context_root.contribution_type
        segment_count     = var.full_web_requests[count.index].id_contributors.context_root.segment_count

        dynamic "transformations" {
          for_each = var.full_web_requests[count.index].id_contributors.context_root.transformations
          content {
            transformation {
              transformation_type = transformations.value.transformation_type
              include_hex_numbers = transformations.value.include_hex_numbers
              min_digit_count     = transformations.value.min_digit_count
            }
          }
        }
      }
    }

    server_name {
      enable_id_contributor = var.full_web_requests[count.index].id_contributors.server_name.enable_id_contributor
      service_id_contributor {
        contribution_type = var.full_web_requests[count.index].id_contributors.server_name.contribution_type
      }
    }
  }
}
