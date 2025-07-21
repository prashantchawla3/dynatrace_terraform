variable "custom_services" {
  type = list(object({
    name       = string
    technology = string
    enabled    = bool
    queue_entry_point = bool
    rules = list(object({
      enabled     = bool
      class_name  = string
      class_match = string
      annotations = optional(list(string))
      methods = list(object({
        name      = string
        arguments = optional(list(string))
        returns   = string
      }))
    }))
  }))
}

variable "custom_service_order" {
  type = object({
    dotnet = list(string)
    java   = list(string)
  })
}

variable "management_zones" {
  type = list(object({
    name  = string
    rules = list(object({
      type            = string
      enabled         = bool
      entity_selector = string
      entity_type     = string
      condition = object({
        case_sensitive = bool
        key            = string
        operator       = string
        string_value   = string
      })
    }))
  }))
}

variable "external_web_requests" {
  type = list(object({
    name            = string
    enabled         = bool
    management_zone = string
    conditions = list(object({
      attribute              = string
      compare_operation_type = string
      ignore_case            = bool
      text_values            = list(string)
    }))
    id_contributors = object({
      port_for_service_id = bool
      application_id = object({
        enable_id_contributor = bool
        contribution_type     = string
        value_override        = optional(string)
      })
      context_root = object({
        enable_id_contributor = bool
        contribution_type     = string
        value_override        = optional(string)
      })
      public_domain_name = object({
        enable_id_contributor = bool
        contribution_type     = string
        copy_from_host_name   = optional(bool)
        transformations       = optional(list(string))
      })
    })
  }))
}

variable "full_web_requests" {
  type = list(object({
    name            = string
    enabled         = bool
    management_zone = string
    conditions = list(object({
      attribute              = string
      compare_operation_type = string
      ignore_case            = bool
      text_values            = list(string)
    }))
    id_contributors = object({
      application_id = object({
        enable_id_contributor = bool
        contribution_type     = string
        value_override        = string
      })
      context_root = object({
        enable_id_contributor = bool
        contribution_type     = string
        segment_count         = number
        transformations = list(object({
          transformation_type   = string
          include_hex_numbers  = bool
          min_digit_count      = number
        }))
      })
      server_name = object({
        enable_id_contributor = bool
        contribution_type     = string
      })
    })
  }))
}

variable "full_web_services" {
  type = list(object({
    name            = string
    enabled         = bool
    management_zone = string
    conditions = list(object({
      attribute              = string
      compare_operation_type = string
      ignore_case            = bool
      text_values            = list(string)
    }))
    id_contributors = object({
      detect_as_web_request_service = bool
    })
  }))
}

variable "unified_services_metrics" {
  type = list(object({
    enable_endpoint_metrics = bool
    service_id              = string
  }))
}

variable "unified_services_opentel" {
  type = list(object({
    enabled = bool
  }))
}

variable "service_detection_rules" {
  type = map(object({
    enabled = bool
    scope   = string
    rules = list(object({
      description                   = string
      additional_required_attributes = list(string)
      condition                     = string
      rule_name                     = string
      service_name_template         = string
    }))
  }))
}

variable "external_web_services" {
  type = map(object({
    name             = string
    description      = string
    enabled          = bool
    management_zones = list(string)
    conditions = list(object({
      condition = list(object({
        attribute              = string
        compare_operation_type = string
        ignore_case            = bool
        text_values            = list(string)
      }))
    }))
    id_contributors = object({
      detect_as_web_request_service = bool
      port_for_service_id           = bool
      url_path = object({
        enable_id_contributor = bool
        service_id_contributor = object({
          contribution_type = string
          value_override = object({
            value = string
          })
        })
      })
    })
  }))
}

variable "service_splitting_rules" {
  type = map(object({
    enabled = bool
    scope   = string
    rules = list(object({
      description   = string
      condition     = string
      rule_name     = string
      service_splitting_attributes = list(object({
        key = string
      }))
    }))
  }))
}
