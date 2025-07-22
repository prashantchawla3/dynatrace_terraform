resource "dynatrace_service_external_web_service" "this" {
  for_each = var.external_web_services

  name             = each.value.name
  description      = each.value.description
  enabled          = each.value.enabled
  management_zones = each.value.management_zones

  dynamic "conditions" {
    for_each = each.value.conditions
    content {
      dynamic "condition" {
        for_each = conditions.value.condition
        content {
          attribute              = condition.value.attribute
          compare_operation_type = condition.value.compare_operation_type
          ignore_case            = condition.value.ignore_case
          text_values            = condition.value.text_values
        }
      }
    }
  }

  dynamic "id_contributors" {
    for_each = each.value.id_contributors != null ? [each.value.id_contributors] : []
    content {
      detect_as_web_request_service = id_contributors.value.detect_as_web_request_service
      port_for_service_id           = id_contributors.value.port_for_service_id

      dynamic "url_path" {
        for_each = id_contributors.value.url_path != null ? [id_contributors.value.url_path] : []
        content {
          enable_id_contributor = url_path.value.enable_id_contributor

          dynamic "service_id_contributor" {
            for_each = url_path.value.service_id_contributor != null ? [url_path.value.service_id_contributor] : []
            content {
              contribution_type = service_id_contributor.value.contribution_type

              dynamic "value_override" {
                for_each = service_id_contributor.value.value_override != null ? [service_id_contributor.value.value_override] : []
                content {
                  value = value_override.value.value
                }
              }
            }
          }
        }
      }
    }
  }
}
