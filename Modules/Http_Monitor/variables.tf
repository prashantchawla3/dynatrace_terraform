variable "http_monitor_cookies" {
  description = "List of HTTP monitor cookie configurations, scoped by entity. Each cookie block defines visibility and cookie parameters."
  type = list(object({
    enabled = bool
    scope   = string
    cookies = list(object({
      name   = string
      domain = string
      value  = string
    }))
  }))
  default = [
    {
      enabled = true
      scope   = "monitor:europe-login"
      cookies = [
        { name = "session", domain = "login.example.com", value = "abc123" },
        { name = "auth", domain = "login.example.com", value = "tokenXYZ" }
      ]
    }
  ]
}

variable "enable_outage_monitoring" {
  description = "Whether to enable global outage monitoring logic"
  type        = bool
  default     = true
}

variable "global_consecutive_outage_count_threshold" {
  description = "Number of consecutive failed runs before triggering global outage"
  type        = number
  default     = 3
}

variable "global_outages" {
  description = "Enable global outage detection"
  type        = bool
  default     = true
}

variable "local_consecutive_outage_count_threshold" {
  description = "Number of consecutive failed runs at location before declaring local outage"
  type        = number
  default     = 2
}

variable "local_location_outage_count_threshold" {
  description = "Number of locations required to fail before declaring a local outage"
  type        = number
  default     = 1
}

variable "local_outages" {
  description = "Enable local outage detection"
  type        = bool
  default     = true
}

variable "outage_scope" {
  description = "Scope to which outage rules apply (e.g., 'monitor-group:frontend')"
  type        = string
  default     = "monitor-group:global"
}

variable "performance_monitors" {
  description = "Performance threshold monitors scoped by entity. Detect event-triggered performance breaches."
  type = list(object({
    enabled    = bool
    scope      = string
    thresholds = list(object({
      event     = string
      threshold = number
    }))
  }))
  default = [
    {
      enabled = true
      scope   = "monitor:checkout"
      thresholds = [
        { event = "LOADING_TIME", threshold = 1500 },
        { event = "TIME_TO_FIRST_BYTE", threshold = 500 }
      ]
    }
  ]
}

variable "scripts" {
  description = "List of HTTP monitor scripts, each with request blocks containing validation, post-processing, and header injection."
  type = list(object({
    http_id  = string
    requests = list(object({
      description     = string
      method          = string
      url             = string
      post_processing = optional(string)
      configuration = object({
        accept_any_certificate = bool
        follow_redirects       = optional(bool)
        headers = optional(list(object({
          name  = string
          value = string
        })))
      })
      validation = optional(object({
        rules = list(object({
          type  = string
          value = string
        }))
      }))
    }))
  }))
  default = [
    {
      http_id  = "synthetic-api-check"
      requests = [
        {
          description = "GET main API health endpoint"
          method      = "GET"
          url         = "https://api.example.com/health"
          configuration = {
            accept_any_certificate = true
            follow_redirects       = true
            headers = [
              { name = "Authorization", value = "Bearer token123" }
            ]
          }
          validation = {
            rules = [
              { type = "CONTAINS", value = "healthy" }
            ]
          }
        }
      ]
    }
  ]
}

variable "monitors" {
  description = "List of synthetic monitor definitions, each with optional script, frequency, locations, and outage handling policies."
  type = list(object({
    name      = string
    frequency = number
    locations = list(string)
    no_script = bool
    anomaly_detection = optional(object({
      loading_time_thresholds = optional(map(any))
      outage_handling = optional(object({
        global_outage = bool
        global_outage_policy = object({
          consecutive_runs = number
        })
      }))
    }))
    script = optional(object({
      requests = list(object({
        description     = string
        method          = string
        url             = string
        post_processing = optional(string)
        configuration = object({
          accept_any_certificate = bool
          follow_redirects       = optional(bool)
          headers = optional(list(object({
            name  = string
            value = string
          })))
        })
        validation = optional(object({
          rules = list(object({
            type  = string
            value = string
          }))
        }))
      }))
    }))
  }))
  default = [
    {
      name      = "Homepage Monitor"
      frequency = 5
      locations = ["GEO-US", "GEO-EU"]
      no_script = false
      anomaly_detection = {
        loading_time_thresholds = { TIME_TO_FIRST_BYTE = 800 }
        outage_handling = {
          global_outage = true
          global_outage_policy = { consecutive_runs = 3 }
        }
      }
      script = {
        requests = [
          {
            description = "Open Homepage"
            method      = "GET"
            url         = "https://example.com"
            configuration = {
              accept_any_certificate = true
              follow_redirects       = true
              headers = []
            }
            validation = {
              rules = [{ type = "STATUS_CODE", value = "200" }]
            }
          }
        ]
      }
    }
  ]
}
