resource "dynatrace_web_app_anomalies" "web_app" {
  for_each = var.web_app_anomalies

  scope = each.value.scope

  error_rate {
    enabled                   = each.value.error_rate.enabled
    error_rate_detection_mode = each.value.error_rate.error_rate_detection_mode

    error_rate_auto {
      absolute_increase = each.value.error_rate.error_rate_auto.absolute_increase
      relative_increase = each.value.error_rate.error_rate_auto.relative_increase

      over_alerting_protection {
        actions_per_minute     = each.value.error_rate.error_rate_auto.over_alerting_protection.actions_per_minute
        minutes_abnormal_state = each.value.error_rate.error_rate_auto.over_alerting_protection.minutes_abnormal_state
      }
    }
  }

  response_time {
    enabled        = each.value.response_time.enabled
    detection_mode = each.value.response_time.detection_mode

    response_time_fixed {
      sensitivity = each.value.response_time.response_time_fixed.sensitivity

      over_alerting_protection {
        actions_per_minute     = each.value.response_time.response_time_fixed.over_alerting_protection.actions_per_minute
        minutes_abnormal_state = each.value.response_time.response_time_fixed.over_alerting_protection.minutes_abnormal_state
      }

      response_time_all {
        degradation_milliseconds = each.value.response_time.response_time_fixed.response_time_all.degradation_milliseconds
      }

      response_time_slowest {
        slowest_degradation_milliseconds = each.value.response_time.response_time_fixed.response_time_slowest.slowest_degradation_milliseconds
      }
    }
  }

  traffic_drops {
    enabled = each.value.traffic_drops.enabled
  }

  traffic_spikes {
    enabled = each.value.traffic_spikes.enabled

    traffic_spikes {
      minutes_abnormal_state   = each.value.traffic_spikes.traffic_spikes.minutes_abnormal_state
      traffic_spike_percentage = each.value.traffic_spikes.traffic_spikes.traffic_spike_percentage
    }
  }
}