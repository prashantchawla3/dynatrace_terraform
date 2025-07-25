variable "host_anomalies" {
  description = "Configuration object for host anomaly detection settings."
  type = object({
    scope = string

    host = optional(object({
      connection_lost_detection = optional(object({
        enabled                = bool
        on_graceful_shutdowns = bool
      }))

      high_cpu_saturation_detection = optional(object({
        enabled        = bool
        detection_mode = string
        custom_thresholds = object({
          cpu_saturation = number
          event_thresholds = object({
            dealerting_evaluation_window = number
            dealerting_samples           = number
            violating_evaluation_window  = number
            violating_samples            = number
          })
        })
      }))

      high_gc_activity_detection = optional(object({
        enabled        = bool
        detection_mode = string
        custom_thresholds = object({
          gc_suspension_percentage = number
          gc_time_percentage       = number
          event_thresholds = object({
            dealerting_evaluation_window = number
            dealerting_samples           = number
            violating_evaluation_window  = number
            violating_samples            = number
          })
        })
      }))

      high_memory_detection = optional(object({
        enabled        = bool
        detection_mode = string
      }))

      high_system_load_detection = optional(object({
        enabled        = bool
        detection_mode = string
        custom_thresholds = object({
          system_load = number
          event_thresholds = object({
            dealerting_evaluation_window = number
            dealerting_samples           = number
            violating_evaluation_window  = number
            violating_samples            = number
          })
        })
      }))

      out_of_memory_detection = optional(object({
        enabled        = bool
        detection_mode = string
        custom_thresholds = object({
          out_of_memory_exceptions_number = number
          event_thresholds = object({
            dealerting_evaluation_window = number
            dealerting_samples           = number
            violating_evaluation_window  = number
            violating_samples            = number
          })
        })
      }))

      out_of_threads_detection = optional(object({
        enabled        = bool
        detection_mode = string
        custom_thresholds = object({
          out_of_threads_exceptions_number = number
          event_thresholds = object({
            dealerting_evaluation_window = number
            dealerting_samples           = number
            violating_evaluation_window  = number
            violating_samples            = number
          })
        })
      }))
    }))

    network = optional(object({
      high_network_detection = optional(object({
        enabled        = bool
        detection_mode = string
        custom_thresholds = object({
          errors_percentage = number
          event_thresholds = object({
            dealerting_evaluation_window = number
            dealerting_samples           = number
            violating_evaluation_window  = number
            violating_samples            = number
          })
        })
      }))

      network_dropped_packets_detection = optional(object({
        enabled        = bool
        detection_mode = string
      }))

      network_errors_detection = optional(object({
        enabled        = bool
        detection_mode = string
      }))

      network_high_retransmission_detection = optional(object({
        enabled        = bool
        detection_mode = string
        custom_thresholds = object({
          retransmission_rate_percentage          = number
          retransmitted_packets_number_per_minute = number
          event_thresholds = object({
            dealerting_evaluation_window = number
            dealerting_samples           = number
            violating_evaluation_window  = number
            violating_samples            = number
          })
        })
      }))

      network_tcp_problems_detection = optional(object({
        enabled        = bool
        detection_mode = string
      }))
    }))
  })
  default = {
    scope = "dynatrace_environment"
    host  = null
    network = null
  }
}
