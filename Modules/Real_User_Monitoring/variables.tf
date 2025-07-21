variable "geolocation" {
  description = "Controls display of world map and defines the scope for geolocation data."
  type = map(object({
    display_worldmap = bool
    scope            = string
  }))
  default = {
    geo1 = {
      display_worldmap = true
      scope            = "environment"
    }
  }
}

variable "process_group_rum" {
  description = "Configures Real User Monitoring (RUM) for specified process groups."
  type = map(object({
    enable           = bool
    process_group_id = string
  }))
  default = {
    pgr1 = {
      enable           = false
      process_group_id = "PROCESS_GROUP-1234567890000000"
    }
  }
}

variable "rum_advanced_correlation" {
  description = "Sets advanced correlation rules for RUM using matchers and patterns."
  type = map(object({
    matcher = string
    pattern = string
  }))
  default = {
    rac1 = {
      matcher = "STARTS_WITH"
      pattern = "Server-Timing-Terraform-2"
    }
  }
}

variable "rum_host_headers" {
  description = "Configures the host header name used in RUM settings."
  type = map(object({
    header_name = string
  }))
  default = {
    rhh1 = {
      header_name = "example-header"
    }
  }
}

variable "rum_ip_determination" {
  description = "Defines headers used to determine IP addresses for RUM."
  type = map(object({
    header_name = string
  }))
  default = {
    rid1 = {
      header_name = "X-Header-Example3"
    }
  }
}

variable "rum_ip_locations" {
  description = "Defines static IP location mappings for RUM."
  type = map(object({
    country_code = string
    ip           = string
    ip_to        = string
    region_code  = string
  }))
  default = {
    ril1 = {
      country_code = "ZA"
      ip           = "192.168.3.1"
      ip_to        = "192.168.3.100"
      region_code  = "05"
    }
  }
}

variable "rum_overload_prevention" {
  description = "Sets thresholds to prevent RUM overload."
  type = map(object({
    overload_prevention_limit = number
  }))
  default = {
    rop1 = {
      overload_prevention_limit = 4000
    }
  }
}

variable "rum_provider_breakdown" {
  description = "Reports RUM data for third-party resources and public improvement options."
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
  default = {
    rpb1 = {
      report_public_improvement = false
      resource_name             = "example"
      resource_type             = "ThirdParty"
      domain_name_pattern_list  = [
        {
          domain_name_pattern = [
            { pattern = "Terraform3rdPartyExample.com" }
          ]
        }
      ]
    }
  }
}

variable "usability_analytics" {
  description = "Enables features like rage-click detection for user analytics."
  type = map(object({
    detect_rage_clicks = bool
    application_id     = optional(string)
  }))
  default = {
    ua1 = {
      detect_rage_clicks = true
    }
    ua2 = {
      detect_rage_clicks = false
      application_id     = "APPLICATION-EA7C4B59F27D43EB"
    }
  }
}

variable "user_action_metrics" {
  description = "Custom user action metrics definitions for analysis and monitoring."
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
  default = {
    uam1 = {
      enabled    = true
      dimensions = ["application"]
      metric_key = "uacm.TerraformTest"
      filters = [
        {
          filter = [
            {
              field_name = "type"
              operator   = "EQUALS"
              value      = "Xhr"
            }
          ]
        }
      ]
      value = {
        type = "COUNTER"
      }
    }
  }
}

variable "user_experience_score" {
  description = "Defines thresholds and conditions to compute user experience scores."
  type = map(object({
    consider_last_action                   = bool
    consider_rage_click                    = bool
    max_frustrated_user_actions_threshold = number
    min_satisfied_user_actions_threshold  = number
  }))
  default = {
    ues1 = {
      consider_last_action                   = false
      consider_rage_click                    = false
      max_frustrated_user_actions_threshold = 20
      min_satisfied_user_actions_threshold  = 60
    }
  }
}

variable "user_session_metrics" {
  description = "Defines custom user session metrics for traffic and behavior analysis."
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
  default = {
    usm1 = {
      enabled    = false
      metric_key = "uscm.TerraformTest"
      filters = [
        {
          filter = [
            {
              field_name = "useraction.application"
              operator   = "EQUALS"
              value      = "www.terraform.io/"
            },
            {
              field_name = "useraction.name"
              operator   = "EQUALS"
              value      = "Loading of page /"
            }
          ]
        }
      ]
      value = {
        type = "COUNTER"
      }
    }
  }
}
