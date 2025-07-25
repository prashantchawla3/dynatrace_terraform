variable "web_app_anomalies" {
  description = "Map of web app anomaly configurations keyed by rule name"
  type = map(object({
    scope = string

    error_rate = object({
      enabled                   = bool
      error_rate_detection_mode = string

      error_rate_auto = object({
        absolute_increase = number
        relative_increase = number

        over_alerting_protection = object({
          actions_per_minute     = number
          minutes_abnormal_state = number
        })
      })
    })

    response_time = object({
      enabled        = bool
      detection_mode = string

      response_time_fixed = object({
        sensitivity = string

        over_alerting_protection = object({
          actions_per_minute     = number
          minutes_abnormal_state = number
        })

        response_time_all = object({
          degradation_milliseconds = number
        })

        response_time_slowest = object({
          slowest_degradation_milliseconds = number
        })
      })
    })

    traffic_drops = object({
      enabled = bool
    })

    traffic_spikes = object({
      enabled = bool

      traffic_spikes = object({
        minutes_abnormal_state   = number
        traffic_spike_percentage = number
      })
    })
  }))
  default = {}
}
