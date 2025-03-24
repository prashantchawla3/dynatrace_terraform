resource "dynatrace_service_anomalies_v2" "example" {
  scope = var.scope

  failure_rate {
    enabled = var.failure_rate_enabled
    detection_mode = var.failure_rate_detection_mode
    fixed_detection {
      sensitivity = var.failure_rate_sensitivity
      threshold = var.failure_rate_threshold
      over_alerting_protection {
        minutes_abnormal_state = var.failure_rate_minutes_abnormal_state
        requests_per_minute = var.failure_rate_requests_per_minute
      }
    }
  }

  load_drops {
    enabled = var.load_drop_enabled
    load_drop_percent = var.load_drop_percent
    minutes_abnormal_state = var.load_drop_minutes_abnormal_state
  }

  load_spikes {
    enabled = var.load_spike_enabled
    load_spike_percent = var.load_spike_percent
    minutes_abnormal_state = var.load_spike_minutes_abnormal_state
  }

  response_time {
    enabled = var.response_time_enabled
    detection_mode = var.response_time_detection_mode
    fixed_detection {
      sensitivity = var.response_time_sensitivity
      over_alerting_protection {
        minutes_abnormal_state = var.response_time_minutes_abnormal_state
        requests_per_minute = var.response_time_requests_per_minute
      }
      response_time_all {
        degradation_milliseconds = var.response_time_degradation_milliseconds
      }
      response_time_slowest {
        slowest_degradation_milliseconds = var.response_time_slowest_degradation_milliseconds
      }
    }
  }
}
