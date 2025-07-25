variable "service_anomalies" {
  description = "Nested configuration for service anomaly detection including failure rates, load patterns, and response times"
  type = object({
    scope = string

    failure_rate = list(object({
      enabled        = bool
      detection_mode = string

      fixed_detection = list(object({
        sensitivity = string
        threshold   = number

        over_alerting_protection = list(object({
          minutes_abnormal_state = number
          requests_per_minute    = number
        }))
      }))
    }))

    load_drops = list(object({
      enabled                = bool
      load_drop_percent      = number
      minutes_abnormal_state = number
    }))

    load_spikes = list(object({
      enabled                = bool
      load_spike_percent     = number
      minutes_abnormal_state = number
    }))

    response_time = list(object({
      enabled        = bool
      detection_mode = string

      fixed_detection = list(object({
        sensitivity = string

        over_alerting_protection = list(object({
          minutes_abnormal_state = number
          requests_per_minute    = number
        }))

        response_time_all = list(object({
          degradation_milliseconds = number
        }))

        response_time_slowest = list(object({
          slowest_degradation_milliseconds = number
        }))
      }))
    }))
  })
  default = {
    scope = "SERVICE_SCOPE_PLACEHOLDER"

    failure_rate = [{
      enabled        = true
      detection_mode = "FIXED"

      fixed_detection = [{
        sensitivity = "HIGH"
        threshold   = 5

        over_alerting_protection = [{
          minutes_abnormal_state = 10
          requests_per_minute    = 100
        }]
      }]
    }]

    load_drops = [{
      enabled                = true
      load_drop_percent      = 20
      minutes_abnormal_state = 15
    }]

    load_spikes = [{
      enabled                = true
      load_spike_percent     = 50
      minutes_abnormal_state = 15
    }]

    response_time = [{
      enabled        = true
      detection_mode = "FIXED"

      fixed_detection = [{
        sensitivity = "MEDIUM"

        over_alerting_protection = [{
          minutes_abnormal_state = 10
          requests_per_minute    = 200
        }]

        response_time_all = [{
          degradation_milliseconds = 800
        }]

        response_time_slowest = [{
          slowest_degradation_milliseconds = 1500
        }]
      }]
    }]
  }
}
