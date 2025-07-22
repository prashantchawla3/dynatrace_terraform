resource "dynatrace_database_anomalies_v2" "this" {
  scope = var.database_scope

  dynamic "database_connections" {
    for_each = var.database_connections != null ? [var.database_connections] : []
    content {
      enabled             = database_connections.value.enabled
      max_failed_connects = database_connections.value.max_failed_connects
      time_period         = database_connections.value.time_period
    }
  }

  dynamic "failure_rate" {
    for_each = var.failure_rate != null ? [var.failure_rate] : []
    content {
      enabled        = failure_rate.value.enabled
      detection_mode = failure_rate.value.detection_mode
      fixed_detection {
        sensitivity = failure_rate.value.fixed_detection.sensitivity
        threshold   = failure_rate.value.fixed_detection.threshold
        over_alerting_protection {
          minutes_abnormal_state = failure_rate.value.fixed_detection.over_alerting_protection.minutes_abnormal_state
          requests_per_minute    = failure_rate.value.fixed_detection.over_alerting_protection.requests_per_minute
        }
      }
    }
  }

  dynamic "load_drops" {
    for_each = var.load_drops != null ? [var.load_drops] : []
    content {
      enabled = load_drops.value.enabled
    }
  }

  dynamic "load_spikes" {
    for_each = var.load_spikes != null ? [var.load_spikes] : []
    content {
      enabled = load_spikes.value.enabled
    }
  }

  dynamic "response_time" {
    for_each = var.response_time != null ? [var.response_time] : []
    content {
      enabled        = response_time.value.enabled
      detection_mode = response_time.value.detection_mode
      fixed_detection {
        sensitivity = response_time.value.fixed_detection.sensitivity
        over_alerting_protection {
          minutes_abnormal_state = response_time.value.fixed_detection.over_alerting_protection.minutes_abnormal_state
          requests_per_minute    = response_time.value.fixed_detection.over_alerting_protection.requests_per_minute
        }
        response_time_all {
          degradation_milliseconds = response_time.value.fixed_detection.response_time_all.degradation_milliseconds
        }
        response_time_slowest {
          slowest_degradation_milliseconds = response_time.value.fixed_detection.response_time_slowest.slowest_degradation_milliseconds
        }
      }
    }
  }
}
