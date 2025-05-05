resource "dynatrace_http_monitor" "this" {
  name      = var.http_monitor_name
  enabled   = var.http_monitor_enabled
  frequency = var.http_monitor_frequency
  locations = var.http_monitor_locations

  anomaly_detection {
    loading_time_thresholds {
      enabled = var.loading_time_thresholds_enabled
    }
    outage_handling {
      global_outage    = var.global_outage
      local_outage     = var.local_outage
      retry_on_error   = var.retry_on_error
      global_outage_policy {
        consecutive_runs = var.consecutive_runs
      }
    }
  }

  script {
    request {
      description = var.http_monitor_description
      method      = var.http_monitor_method
      url         = var.http_monitor_url
      configuration {
        accept_any_certificate = var.accept_any_certificate
        follow_redirects       = var.follow_redirects
      }
      validation {
        rule {
          type          = var.validation_type
          value         = var.validation_value
          pass_if_found = var.pass_if_found
        }
      }
    }
  }
}