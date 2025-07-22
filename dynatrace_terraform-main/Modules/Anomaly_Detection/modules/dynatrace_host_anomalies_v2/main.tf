resource "dynatrace_host_anomalies_v2" "this" {
  scope = var.host_anomalies.scope

  dynamic "host" {
    for_each = var.host_anomalies.host != null ? [1] : []
    content {
      dynamic "connection_lost_detection" {
        for_each = var.host_anomalies.host.connection_lost_detection != null ? [1] : []
        content {
          enabled               = var.host_anomalies.host.connection_lost_detection.enabled
          on_graceful_shutdowns = var.host_anomalies.host.connection_lost_detection.on_graceful_shutdowns
        }
      }

      dynamic "high_cpu_saturation_detection" {
        for_each = var.host_anomalies.host.high_cpu_saturation_detection != null ? [1] : []
        content {
          enabled        = var.host_anomalies.host.high_cpu_saturation_detection.enabled
          detection_mode = var.host_anomalies.host.high_cpu_saturation_detection.detection_mode
          custom_thresholds {
            cpu_saturation = var.host_anomalies.host.high_cpu_saturation_detection.custom_thresholds.cpu_saturation
            event_thresholds {
              dealerting_evaluation_window = var.host_anomalies.host.high_cpu_saturation_detection.custom_thresholds.event_thresholds.dealerting_evaluation_window
              dealerting_samples           = var.host_anomalies.host.high_cpu_saturation_detection.custom_thresholds.event_thresholds.dealerting_samples
              violating_evaluation_window  = var.host_anomalies.host.high_cpu_saturation_detection.custom_thresholds.event_thresholds.violating_evaluation_window
              violating_samples            = var.host_anomalies.host.high_cpu_saturation_detection.custom_thresholds.event_thresholds.violating_samples
            }
          }
        }
      }

      dynamic "high_gc_activity_detection" {
        for_each = var.host_anomalies.host.high_gc_activity_detection != null ? [1] : []
        content {
          enabled        = var.host_anomalies.host.high_gc_activity_detection.enabled
          detection_mode = var.host_anomalies.host.high_gc_activity_detection.detection_mode
          custom_thresholds {
            gc_suspension_percentage = var.host_anomalies.host.high_gc_activity_detection.custom_thresholds.gc_suspension_percentage
            gc_time_percentage       = var.host_anomalies.host.high_gc_activity_detection.custom_thresholds.gc_time_percentage
            event_thresholds {
              dealerting_evaluation_window = var.host_anomalies.host.high_gc_activity_detection.custom_thresholds.event_thresholds.dealerting_evaluation_window
              dealerting_samples           = var.host_anomalies.host.high_gc_activity_detection.custom_thresholds.event_thresholds.dealerting_samples
              violating_evaluation_window  = var.host_anomalies.host.high_gc_activity_detection.custom_thresholds.event_thresholds.violating_evaluation_window
              violating_samples            = var.host_anomalies.host.high_gc_activity_detection.custom_thresholds.event_thresholds.violating_samples
            }
          }
        }
      }

      dynamic "high_memory_detection" {
        for_each = var.host_anomalies.host.high_memory_detection != null ? [1] : []
        content {
          enabled        = var.host_anomalies.host.high_memory_detection.enabled
          detection_mode = var.host_anomalies.host.high_memory_detection.detection_mode
        }
      }

      dynamic "high_system_load_detection" {
        for_each = var.host_anomalies.host.high_system_load_detection != null ? [1] : []
        content {
          enabled        = var.host_anomalies.host.high_system_load_detection.enabled
          detection_mode = var.host_anomalies.host.high_system_load_detection.detection_mode
          custom_thresholds {
            system_load = var.host_anomalies.host.high_system_load_detection.custom_thresholds.system_load
            event_thresholds {
              dealerting_evaluation_window = var.host_anomalies.host.high_system_load_detection.custom_thresholds.event_thresholds.dealerting_evaluation_window
              dealerting_samples           = var.host_anomalies.host.high_system_load_detection.custom_thresholds.event_thresholds.dealerting_samples
              violating_evaluation_window  = var.host_anomalies.host.high_system_load_detection.custom_thresholds.event_thresholds.violating_evaluation_window
              violating_samples            = var.host_anomalies.host.high_system_load_detection.custom_thresholds.event_thresholds.violating_samples
            }
          }
        }
      }

      dynamic "out_of_memory_detection" {
        for_each = var.host_anomalies.host.out_of_memory_detection != null ? [1] : []
        content {
          enabled        = var.host_anomalies.host.out_of_memory_detection.enabled
          detection_mode = var.host_anomalies.host.out_of_memory_detection.detection_mode
          custom_thresholds {
            out_of_memory_exceptions_number = var.host_anomalies.host.out_of_memory_detection.custom_thresholds.out_of_memory_exceptions_number
            event_thresholds {
              dealerting_evaluation_window = var.host_anomalies.host.out_of_memory_detection.custom_thresholds.event_thresholds.dealerting_evaluation_window
              dealerting_samples           = var.host_anomalies.host.out_of_memory_detection.custom_thresholds.event_thresholds.dealerting_samples
              violating_evaluation_window  = var.host_anomalies.host.out_of_memory_detection.custom_thresholds.event_thresholds.violating_evaluation_window
              violating_samples            = var.host_anomalies.host.out_of_memory_detection.custom_thresholds.event_thresholds.violating_samples
            }
          }
        }
      }

      dynamic "out_of_threads_detection" {
        for_each = var.host_anomalies.host.out_of_threads_detection != null ? [1] : []
        content {
          enabled        = var.host_anomalies.host.out_of_threads_detection.enabled
          detection_mode = var.host_anomalies.host.out_of_threads_detection.detection_mode
          custom_thresholds {
            out_of_threads_exceptions_number = var.host_anomalies.host.out_of_threads_detection.custom_thresholds.out_of_threads_exceptions_number
            event_thresholds {
              dealerting_evaluation_window = var.host_anomalies.host.out_of_threads_detection.custom_thresholds.event_thresholds.dealerting_evaluation_window
              dealerting_samples           = var.host_anomalies.host.out_of_threads_detection.custom_thresholds.event_thresholds.dealerting_samples
              violating_evaluation_window  = var.host_anomalies.host.out_of_threads_detection.custom_thresholds.event_thresholds.violating_evaluation_window
              violating_samples            = var.host_anomalies.host.out_of_threads_detection.custom_thresholds.event_thresholds.violating_samples
            }
          }
        }
      }
    }
  }

  dynamic "network" {
    for_each = var.host_anomalies.network != null ? [1] : []
    content {
      dynamic "high_network_detection" {
        for_each = var.host_anomalies.network.high_network_detection != null ? [1] : []
        content {
          enabled        = var.host_anomalies.network.high_network_detection.enabled
          detection_mode = var.host_anomalies.network.high_network_detection.detection_mode
          custom_thresholds {
            errors_percentage = var.host_anomalies.network.high_network_detection.custom_thresholds.errors_percentage
            event_thresholds {
              dealerting_evaluation_window = var.host_anomalies.network.high_network_detection.custom_thresholds.event_thresholds.dealerting_evaluation_window
              dealerting_samples           = var.host_anomalies.network.high_network_detection.custom_thresholds.event_thresholds.dealerting_samples
              violating_evaluation_window  = var.host_anomalies.network.high_network_detection.custom_thresholds.event_thresholds.violating_evaluation_window
              violating_samples            = var.host_anomalies.network.high_network_detection.custom_thresholds.event_thresholds.violating_samples
            }
          }
        }
      }

      dynamic "network_dropped_packets_detection" {
        for_each = var.host_anomalies.network.network_dropped_packets_detection != null ? [1] : []
        content {
          enabled        = var.host_anomalies.network.network_dropped_packets_detection.enabled
          detection_mode = var.host_anomalies.network.network_dropped_packets_detection.detection_mode
        }
      }

      dynamic "network_errors_detection" {
        for_each = var.host_anomalies.network.network_errors_detection != null ? [1] : []
        content {
          enabled        = var.host_anomalies.network.network_errors_detection.enabled
          detection_mode = var.host_anomalies.network.network_errors_detection.detection_mode
        }
      }

      dynamic "network_high_retransmission_detection" {
        for_each = var.host_anomalies.network.network_high_retransmission_detection != null ? [1] : []
        content {
          enabled        = var.host_anomalies.network.network_high_retransmission_detection.enabled
          detection_mode = var.host_anomalies.network.network_high_retransmission_detection.detection_mode
          custom_thresholds {
            retransmission_rate_percentage          = var.host_anomalies.network.network_high_retransmission_detection.custom_thresholds.retransmission_rate_percentage
            retransmitted_packets_number_per_minute = var.host_anomalies.network.network_high_retransmission_detection.custom_thresholds.retransmitted_packets_number_per_minute
            event_thresholds {
              dealerting_evaluation_window = var.host_anomalies.network.network_high_retransmission_detection.custom_thresholds.event_thresholds.dealerting_evaluation_window
              dealerting_samples           = var.host_anomalies.network.network_high_retransmission_detection.custom_thresholds.event_thresholds.dealerting_samples
              violating_evaluation_window  = var.host_anomalies.network.network_high_retransmission_detection.custom_thresholds.event_thresholds.violating_evaluation_window
              violating_samples            = var.host_anomalies.network.network_high_retransmission_detection.custom_thresholds.event_thresholds.violating_samples
            }
          }
        }
      }

      dynamic "network_tcp_problems_detection" {
        for_each = var.host_anomalies.network.network_tcp_problems_detection != null ? [1] : []
        content {
          enabled        = var.host_anomalies.network.network_tcp_problems_detection.enabled
          detection_mode = var.host_anomalies.network.network_tcp_problems_detection.detection_mode
        }
      }
    }
  }
}
