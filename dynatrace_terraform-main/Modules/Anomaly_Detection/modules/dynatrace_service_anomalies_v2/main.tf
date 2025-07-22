resource "dynatrace_service_anomalies_v2" "this" {
  scope = var.service_anomalies.scope

  dynamic "failure_rate" {
    for_each = var.service_anomalies.failure_rate[*]
    content {
      enabled        = failure_rate.value.enabled
      detection_mode = failure_rate.value.detection_mode

      dynamic "fixed_detection" {
        for_each = failure_rate.value.fixed_detection[*]
        content {
          sensitivity = fixed_detection.value.sensitivity
          threshold   = fixed_detection.value.threshold

          dynamic "over_alerting_protection" {
            for_each = fixed_detection.value.over_alerting_protection[*]
            content {
              minutes_abnormal_state = over_alerting_protection.value.minutes_abnormal_state
              requests_per_minute    = over_alerting_protection.value.requests_per_minute
            }
          }
        }
      }
    }
  }

  dynamic "load_drops" {
    for_each = var.service_anomalies.load_drops[*]
    content {
      enabled                = load_drops.value.enabled
      load_drop_percent      = load_drops.value.load_drop_percent
      minutes_abnormal_state = load_drops.value.minutes_abnormal_state
    }
  }

  dynamic "load_spikes" {
    for_each = var.service_anomalies.load_spikes[*]
    content {
      enabled                = load_spikes.value.enabled
      load_spike_percent     = load_spikes.value.load_spike_percent
      minutes_abnormal_state = load_spikes.value.minutes_abnormal_state
    }
  }

  dynamic "response_time" {
    for_each = var.service_anomalies.response_time[*]
    content {
      enabled        = response_time.value.enabled
      detection_mode = response_time.value.detection_mode

      dynamic "fixed_detection" {
        for_each = response_time.value.fixed_detection[*]
        content {
          sensitivity = fixed_detection.value.sensitivity

          dynamic "over_alerting_protection" {
            for_each = fixed_detection.value.over_alerting_protection[*]
            content {
              minutes_abnormal_state = over_alerting_protection.value.minutes_abnormal_state
              requests_per_minute    = over_alerting_protection.value.requests_per_minute
            }
          }

          dynamic "response_time_all" {
            for_each = fixed_detection.value.response_time_all[*]
            content {
              degradation_milliseconds = response_time_all.value.degradation_milliseconds
            }
          }

          dynamic "response_time_slowest" {
            for_each = fixed_detection.value.response_time_slowest[*]
            content {
              slowest_degradation_milliseconds = response_time_slowest.value.slowest_degradation_milliseconds
            }
          }
        }
      }
    }
  }
}