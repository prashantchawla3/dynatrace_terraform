variable "geolocation" {
  type = map(object({
    display_worldmap = bool
    scope            = string
  }))
}

variable "process_group_rum" {
  type = map(object({
    enable           = bool
    process_group_id = string
  }))
}

variable "rum_advanced_correlation" {
  type = map(object({
    matcher = string
    pattern = string
  }))
}

variable "rum_host_headers" {
  type = map(object({
    header_name = string
  }))
}

variable "rum_ip_determination" {
  type = map(object({
    header_name = string
  }))
}

variable "rum_ip_locations" {
  type = map(object({
    country_code = string
    ip           = string
    ip_to        = string
    region_code  = string
  }))
}

variable "rum_overload_prevention" {
  type = map(object({
    overload_prevention_limit = number
  }))
}

variable "rum_provider_breakdown" {
  type = map(object({
    report_public_improvement = bool
    resource_name             = string
    resource_type             = string
    domain_name_pattern_list  = list(object({
      domain_name_pattern = list(object({
        pattern = string
      }))
    }))
  }))
}

variable "usability_analytics" {
  type = map(object({
    detect_rage_clicks = bool
    application_id     = optional(string)
  }))
}

variable "user_action_metrics" {
  type = map(object({
    enabled    = bool
    dimensions = list(string)
    metric_key = string
    filters    = list(object({
      filter = list(object({
        field_name = string
        operator   = string
        value      = string
      }))
    }))
    value = object({
      type = string
    })
  }))
}

variable "user_experience_score" {
  type = map(object({
    consider_last_action                   = bool
    consider_rage_click                    = bool
    max_frustrated_user_actions_threshold = number
    min_satisfied_user_actions_threshold  = number
  }))
}

variable "user_session_metrics" {
  type = map(object({
    enabled    = bool
    metric_key = string
    filters    = list(object({
      filter = list(object({
        field_name = string
        operator   = string
        value      = string
      }))
    }))
    value = object({
      type = string
    })
  }))
}
