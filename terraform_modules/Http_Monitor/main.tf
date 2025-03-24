resource "dynatrace_http_monitor" "Terraform_test_HTTP" {
  name      = var.httpMonitorName
  enabled   = true
  frequency = var.httpMonitorFrequency
  locations = [var.httpLocationId]
  
  anomaly_detection {
    loading_time_thresholds {
      # enabled = false
    }
    outage_handling {
      global_outage    = true
      # local_outage   = false
      # retry_on_error = false
      global_outage_policy {
        consecutive_runs = 1
      }
    }
  }
  
  script {
    request {
      description = var.httpMonitorName
      method      = "GET"
      url         = var.httpMonitorUrl
      configuration {
        accept_any_certificate = true
        follow_redirects       = true
      }
      validation {
        rule {
          type  = "httpStatusesList"
          # pass_if_found = false
          value = ">=400"
        }
      }
    }
  }
}