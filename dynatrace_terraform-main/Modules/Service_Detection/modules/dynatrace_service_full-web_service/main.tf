resource "dynatrace_service_full_web_service" "this" {
  count            = length(var.full_web_services)
  name             = var.full_web_services[count.index].name
  enabled          = var.full_web_services[count.index].enabled
  description      = "Created by Terraform"
  management_zones = [var.full_web_services[count.index].management_zone]

  dynamic "conditions" {
    for_each = var.full_web_services[count.index].conditions
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
    detect_as_web_request_service = var.full_web_services[count.index].id_contributors.detect_as_web_request_service
  }
}
