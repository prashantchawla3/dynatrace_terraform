resource "dynatrace_service_external_web_request" "this" {
  count             = length(var.external_web_requests)
  name              = var.external_web_requests[count.index].name
  enabled           = var.external_web_requests[count.index].enabled
  description       = "Created by Terraform"
  management_zones  = [var.external_web_requests[count.index].management_zone]

  dynamic "conditions" {
    for_each = var.external_web_requests[count.index].conditions
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
    port_for_service_id = var.external_web_requests[count.index].id_contributors.port_for_service_id

    application_id {
      enable_id_contributor = var.external_web_requests[count.index].id_contributors.application_id.enable_id_contributor
      service_id_contributor {
        contribution_type = var.external_web_requests[count.index].id_contributors.application_id.contribution_type
        dynamic "value_override" {
          for_each = var.external_web_requests[count.index].id_contributors.application_id.value_override != null ? [1] : []
          content {
            value = var.external_web_requests[count.index].id_contributors.application_id.value_override
          }
        }
      }
    }

    context_root {
      enable_id_contributor = var.external_web_requests[count.index].id_contributors.context_root.enable_id_contributor
      service_id_contributor {
        contribution_type = var.external_web_requests[count.index].id_contributors.context_root.contribution_type
        dynamic "value_override" {
          for_each = var.external_web_requests[count.index].id_contributors.context_root.value_override != null ? [1] : []
          content {
            value = var.external_web_requests[count.index].id_contributors.context_root.value_override
          }
        }
      }
    }

    public_domain_name {
      enable_id_contributor = var.external_web_requests[count.index].id_contributors.public_domain_name.enable_id_contributor
      service_id_contributor {
        contribution_type   = var.external_web_requests[count.index].id_contributors.public_domain_name.contribution_type
        copy_from_host_name = lookup(var.external_web_requests[count.index].id_contributors.public_domain_name, "copy_from_host_name", null)

        dynamic "transformations" {
          for_each = lookup(var.external_web_requests[count.index].id_contributors.public_domain_name, "transformations", [])
          content {
            transformation {
              transformation_type = transformations.value
            }
          }
        }
      }
    }
  }
}
