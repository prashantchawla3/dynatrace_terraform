

resource "dynatrace_custom_service" "this" {
  count             = length(var.custom_services)
  name              = var.custom_services[count.index].name
  technology        = var.custom_services[count.index].technology
  enabled           = var.custom_services[count.index].enabled
  queue_entry_point = var.custom_services[count.index].queue_entry_point

  dynamic "rule" {
    for_each = var.custom_services[count.index].rules
    content {
      enabled = rule.value.enabled

      class {
        name  = rule.value.class_name
        match = rule.value.class_match
      }

      dynamic "method" {
        for_each = rule.value.methods
        content {
          name      = method.value.name
          arguments = lookup(method.value, "arguments", null)
          returns   = method.value.returns
        }
      }

      annotations = lookup(rule.value, "annotations", null)
    }
  }
}

resource "dynatrace_custom_service_order" "this" {
  dotnet = var.custom_service_order.dotnet
  java   = var.custom_service_order.java
}



resource "dynatrace_management_zone_v2" "this" {
  count = length(var.management_zones)

  name = var.management_zones[count.index].name

  dynamic "rules" {
    for_each = var.management_zones[count.index].rules
    content {
      rule {
        type            = rules.value.type
        enabled         = rules.value.enabled
        entity_selector = rules.value.entity_selector

        attribute_rule {
          entity_type = rules.value.entity_type

          attribute_conditions {
            condition {
              case_sensitive = rules.value.condition.case_sensitive
              key            = rules.value.condition.key
              operator       = rules.value.condition.operator
              string_value   = rules.value.condition.string_value
            }
          }
        }
      }
    }
  }
}


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


resource "dynatrace_unified_services_metrics" "this" {
  count                 = length(var.unified_services_metrics)
  enable_endpoint_metrics = var.unified_services_metrics[count.index].enable_endpoint_metrics
  service_id              = var.unified_services_metrics[count.index].service_id
}

resource "dynatrace_unified_services_opentel" "this" {
  count   = length(var.unified_services_opentel)
  enabled = var.unified_services_opentel[count.index].enabled
}

resource "dynatrace_service_detection_rules" "this" {
  for_each = var.service_detection_rules

  enabled = each.value.enabled
  scope   = each.value.scope

  dynamic "rule" {
    for_each = each.value.rules
    content {
      description                   = rule.value.description
      additional_required_attributes = rule.value.additional_required_attributes
      condition                     = rule.value.condition
      rule_name                     = rule.value.rule_name
      service_name_template         = rule.value.service_name_template
    }
  }
}

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

resource "dynatrace_service_splitting" "this" {
  for_each = var.service_splitting_rules

  enabled = each.value.enabled
  scope   = each.value.scope

  dynamic "rule" {
    for_each = each.value.rules
    content {
      description   = rule.value.description
      condition     = rule.value.condition
      rule_name     = rule.value.rule_name

      dynamic "service_splitting_attributes" {
        for_each = [rule.value.service_splitting_attributes]
        content {
          dynamic "service_splitting_attribute" {
            for_each = service_splitting_attributes.value
            content {
              key = service_splitting_attribute.value.key
            }
          }
        }
      }
    }
  }
}
