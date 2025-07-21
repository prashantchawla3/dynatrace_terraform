resource "dynatrace_disk_anomalies_v2" "this" {
  for_each = { for idx, conf in var.disk_anomalies : idx => conf }

  scope = each.value.scope

  dynamic "disk" {
    for_each = each.value.disk
    content {
      disk_low_space_detection {
        enabled = disk.value.disk_low_space_detection.enabled
      }
      disk_slow_writes_and_reads_detection {
        enabled = disk.value.disk_slow_writes_and_reads_detection.enabled
      }
      disk_low_inodes_detection {
        enabled = disk.value.disk_low_inodes_detection.enabled
      }
    }
  }
}


# dynatrace_disk_anomaly_rules resources (multiple instances via for_each)
resource "dynatrace_disk_anomaly_rules" "this" {
  for_each = { for idx, conf in var.disk_anomaly_rules : idx => conf }

  name    = each.value.name
  enabled = each.value.enabled
  metric  = each.value.metric

  disk_name_filter {
    operator = each.value.disk_name_filter.operator
    # Disk name filter attributes
  }

  sample_limit {
    samples           = each.value.sample_limit.samples
    violating_samples = each.value.sample_limit.violating_samples
    # Sample limit attributes
  }
}

# dynatrace_disk_edge_anomaly_detectors resources (multiple instances via for_each)
resource "dynatrace_disk_edge_anomaly_detectors" "this" {
  for_each = { for idx, conf in var.disk_edge_detectors : idx => conf }

  policy_name = each.value.policy_name
  enabled     = each.value.enabled

  event_properties {
    event_propertie {
      metadata_key   = each.value.event_properties.event_propertie.metadata_key
      metadata_value = each.value.event_properties.event_propertie.metadata_value
    }
  }

  alerts {
    alert {
      trigger = each.value.alerts.alert.trigger
      # Alert attributes
    }
  }
}

# dynatrace_disk_specific_anomalies_v2 resources (multiple instances via for_each)
resource "dynatrace_disk_specific_anomalies_v2" "this" {
  for_each = { for idx, conf in var.disk_specific_anomalies : idx => conf }

  disk_id                                  = each.value.disk_id
  override_disk_low_space_detection        = each.value.override_disk_low_space_detection
  override_low_inodes_detection            = each.value.override_low_inodes_detection
  override_slow_writes_and_reads_detection = each.value.override_slow_writes_and_reads_detection

  disk_low_space_detection {
    enabled = each.value.disk_low_space_detection.enabled
    # Attributes for disk_low_space_detection
  }

  disk_low_inodes_detection {
    enabled = each.value.disk_low_inodes_detection.enabled
    # Attributes for disk_low_inodes_detection
  }
}
resource "dynatrace_aws_anomalies" "this" {
  dynamic "ec_2_candidate_high_cpu_detection" {
    for_each = var.ec_2_candidate_high_cpu_detection != null ? [var.ec_2_candidate_high_cpu_detection] : []
    content {
      enabled        = ec_2_candidate_high_cpu_detection.value.enabled
      detection_mode = ec_2_candidate_high_cpu_detection.value.detection_mode
      custom_thresholds {
        cpu_usage = ec_2_candidate_high_cpu_detection.value.custom_thresholds.cpu_usage
      }
    }
  }

  dynamic "elb_high_connection_errors_detection" {
    for_each = var.elb_high_connection_errors_detection != null ? [var.elb_high_connection_errors_detection] : []
    content {
      enabled        = elb_high_connection_errors_detection.value.enabled
      detection_mode = elb_high_connection_errors_detection.value.detection_mode
      custom_thresholds {
        connection_errors_per_minute = elb_high_connection_errors_detection.value.custom_thresholds.connection_errors_per_minute
      }
    }
  }

  dynamic "lambda_high_error_rate_detection" {
    for_each = var.lambda_high_error_rate_detection != null ? [var.lambda_high_error_rate_detection] : []
    content {
      enabled        = lambda_high_error_rate_detection.value.enabled
      detection_mode = lambda_high_error_rate_detection.value.detection_mode
      custom_thresholds {
        failed_invocations_rate = lambda_high_error_rate_detection.value.custom_thresholds.failed_invocations_rate
      }
    }
  }

  dynamic "rds_high_cpu_detection" {
    for_each = var.rds_high_cpu_detection != null ? [var.rds_high_cpu_detection] : []
    content {
      enabled = rds_high_cpu_detection.value.enabled
    }
  }

  dynamic "rds_high_memory_detection" {
    for_each = var.rds_high_memory_detection != null ? [var.rds_high_memory_detection] : []
    content {
      enabled        = rds_high_memory_detection.value.enabled
      detection_mode = rds_high_memory_detection.value.detection_mode
      custom_thresholds {
        free_memory = rds_high_memory_detection.value.custom_thresholds.free_memory
        swap_usage  = rds_high_memory_detection.value.custom_thresholds.swap_usage
      }
    }
  }

  dynamic "rds_high_write_read_latency_detection" {
    for_each = var.rds_high_write_read_latency_detection != null ? [var.rds_high_write_read_latency_detection] : []
    content {
      enabled        = rds_high_write_read_latency_detection.value.enabled
      detection_mode = rds_high_write_read_latency_detection.value.detection_mode
      custom_thresholds {
        read_write_latency = rds_high_write_read_latency_detection.value.custom_thresholds.read_write_latency
      }
    }
  }

  dynamic "rds_low_storage_detection" {
    for_each = var.rds_low_storage_detection != null ? [var.rds_low_storage_detection] : []
    content {
      enabled = rds_low_storage_detection.value.enabled
    }
  }

  dynamic "rds_restarts_sequence_detection" {
    for_each = var.rds_restarts_sequence_detection != null ? [var.rds_restarts_sequence_detection] : []
    content {
      enabled = rds_restarts_sequence_detection.value.enabled
    }
  }
}

resource "dynatrace_custom_app_anomalies" "this" {
  scope = var.custom_app_scope

  dynamic "error_rate_increase" {
    for_each = var.error_rate_increase != null ? [var.error_rate_increase] : []
    content {
      enabled        = error_rate_increase.value.enabled
      detection_mode = error_rate_increase.value.detection_mode
      error_rate_increase_fixed {
        sensitivity        = error_rate_increase.value.error_rate_increase_fixed.sensitivity
        threshold_absolute = error_rate_increase.value.error_rate_increase_fixed.threshold_absolute
      }
    }
  }

  dynamic "slow_user_actions" {
    for_each = var.slow_user_actions != null ? [var.slow_user_actions] : []
    content {
      enabled = slow_user_actions.value.enabled
    }
  }

  dynamic "unexpected_high_load" {
    for_each = var.unexpected_high_load != null ? [var.unexpected_high_load] : []
    content {
      enabled              = unexpected_high_load.value.enabled
      threshold_percentage = unexpected_high_load.value.threshold_percentage
    }
  }

  dynamic "unexpected_low_load" {
    for_each = var.unexpected_low_load != null ? [var.unexpected_low_load] : []
    content {
      enabled              = unexpected_low_load.value.enabled
      threshold_percentage = unexpected_low_load.value.threshold_percentage
    }
  }
}

resource "dynatrace_custom_app_crash_rate" "this" {
  scope = var.custom_app_scope

  dynamic "crash_rate_increase" {
    for_each = var.crash_rate_increase != null ? [var.crash_rate_increase] : []
    content {
      enabled        = crash_rate_increase.value.enabled
      detection_mode = crash_rate_increase.value.detection_mode
      crash_rate_increase_fixed {
        absolute_crash_rate = crash_rate_increase.value.crash_rate_increase_fixed.absolute_crash_rate
        concurrent_users    = crash_rate_increase.value.crash_rate_increase_fixed.concurrent_users
      }
    }
  }
}

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

resource "dynatrace_frequent_issues" "this" {
  detect_apps  = var.frequent_issues.detect_apps
  detect_txn   = var.frequent_issues.detect_txn
  detect_infra = var.frequent_issues.detect_infra
}

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

resource "dynatrace_k8s_cluster_anomalies" "this" {
  scope = var.k8s_cluster_anomalies.scope

  dynamic "cpu_requests_saturation" {
    for_each = var.k8s_cluster_anomalies.cpu_requests_saturation != null ? [1] : []
    content {
      enabled = var.k8s_cluster_anomalies.cpu_requests_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_cluster_anomalies.cpu_requests_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_cluster_anomalies.cpu_requests_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_cluster_anomalies.cpu_requests_saturation.configuration.threshold
      }
    }
  }

  dynamic "memory_requests_saturation" {
    for_each = var.k8s_cluster_anomalies.memory_requests_saturation != null ? [1] : []
    content {
      enabled = var.k8s_cluster_anomalies.memory_requests_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_cluster_anomalies.memory_requests_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_cluster_anomalies.memory_requests_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_cluster_anomalies.memory_requests_saturation.configuration.threshold
      }
    }
  }

  dynamic "monitoring_issues" {
    for_each = var.k8s_cluster_anomalies.monitoring_issues != null ? [1] : []
    content {
      enabled = var.k8s_cluster_anomalies.monitoring_issues.enabled
      configuration {
        observation_period_in_minutes = var.k8s_cluster_anomalies.monitoring_issues.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_cluster_anomalies.monitoring_issues.configuration.sample_period_in_minutes
      }
    }
  }

  dynamic "pods_saturation" {
    for_each = var.k8s_cluster_anomalies.pods_saturation != null ? [1] : []
    content {
      enabled = var.k8s_cluster_anomalies.pods_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_cluster_anomalies.pods_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_cluster_anomalies.pods_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_cluster_anomalies.pods_saturation.configuration.threshold
      }
    }
  }

  dynamic "readiness_issues" {
    for_each = var.k8s_cluster_anomalies.readiness_issues != null ? [1] : []
    content {
      enabled = var.k8s_cluster_anomalies.readiness_issues.enabled
      configuration {
        observation_period_in_minutes = var.k8s_cluster_anomalies.readiness_issues.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_cluster_anomalies.readiness_issues.configuration.sample_period_in_minutes
      }
    }
  }
}

resource "dynatrace_k8s_namespace_anomalies" "this" {
  scope = var.k8s_namespace_anomalies.scope

  dynamic "cpu_limits_quota_saturation" {
    for_each = var.k8s_namespace_anomalies.cpu_limits_quota_saturation != null ? [1] : []
    content {
      enabled = var.k8s_namespace_anomalies.cpu_limits_quota_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_namespace_anomalies.cpu_limits_quota_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_namespace_anomalies.cpu_limits_quota_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_namespace_anomalies.cpu_limits_quota_saturation.configuration.threshold
      }
    }
  }

  dynamic "cpu_requests_quota_saturation" {
    for_each = var.k8s_namespace_anomalies.cpu_requests_quota_saturation != null ? [1] : []
    content {
      enabled = var.k8s_namespace_anomalies.cpu_requests_quota_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_namespace_anomalies.cpu_requests_quota_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_namespace_anomalies.cpu_requests_quota_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_namespace_anomalies.cpu_requests_quota_saturation.configuration.threshold
      }
    }
  }

  dynamic "memory_limits_quota_saturation" {
    for_each = var.k8s_namespace_anomalies.memory_limits_quota_saturation != null ? [1] : []
    content {
      enabled = var.k8s_namespace_anomalies.memory_limits_quota_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_namespace_anomalies.memory_limits_quota_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_namespace_anomalies.memory_limits_quota_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_namespace_anomalies.memory_limits_quota_saturation.configuration.threshold
      }
    }
  }

  dynamic "memory_requests_quota_saturation" {
    for_each = var.k8s_namespace_anomalies.memory_requests_quota_saturation != null ? [1] : []
    content {
      enabled = var.k8s_namespace_anomalies.memory_requests_quota_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_namespace_anomalies.memory_requests_quota_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_namespace_anomalies.memory_requests_quota_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_namespace_anomalies.memory_requests_quota_saturation.configuration.threshold
      }
    }
  }

  dynamic "pods_quota_saturation" {
    for_each = var.k8s_namespace_anomalies.pods_quota_saturation != null ? [1] : []
    content {
      enabled = var.k8s_namespace_anomalies.pods_quota_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_namespace_anomalies.pods_quota_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_namespace_anomalies.pods_quota_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_namespace_anomalies.pods_quota_saturation.configuration.threshold
      }
    }
  }
}
resource "dynatrace_k8s_node_anomalies" "this" {
  scope = var.k8s_node_anomalies.scope

  dynamic "cpu_requests_saturation" {
    for_each = var.k8s_node_anomalies.cpu_requests_saturation != null ? [1] : []
    content {
      enabled = var.k8s_node_anomalies.cpu_requests_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_node_anomalies.cpu_requests_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_node_anomalies.cpu_requests_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_node_anomalies.cpu_requests_saturation.configuration.threshold
      }
    }
  }

  dynamic "memory_requests_saturation" {
    for_each = var.k8s_node_anomalies.memory_requests_saturation != null ? [1] : []
    content {
      enabled = var.k8s_node_anomalies.memory_requests_saturation.enabled
    }
  }

  dynamic "pods_saturation" {
    for_each = var.k8s_node_anomalies.pods_saturation != null ? [1] : []
    content {
      enabled = var.k8s_node_anomalies.pods_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_node_anomalies.pods_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_node_anomalies.pods_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_node_anomalies.pods_saturation.configuration.threshold
      }
    }
  }

  dynamic "readiness_issues" {
    for_each = var.k8s_node_anomalies.readiness_issues != null ? [1] : []
    content {
      enabled = var.k8s_node_anomalies.readiness_issues.enabled
    }
  }

  dynamic "node_problematic_condition" {
    for_each = var.k8s_node_anomalies.node_problematic_condition != null ? [1] : []
    content {
      enabled = var.k8s_node_anomalies.node_problematic_condition.enabled
    }
  }
}

resource "dynatrace_k8s_pvc_anomalies" "this" {
  scope = var.k8s_pvc_anomalies.scope

  dynamic "low_disk_space_critical" {
    for_each = var.k8s_pvc_anomalies.low_disk_space_critical != null ? [1] : []
    content {
      enabled = var.k8s_pvc_anomalies.low_disk_space_critical.enabled
      configuration {
        observation_period_in_minutes = var.k8s_pvc_anomalies.low_disk_space_critical.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_pvc_anomalies.low_disk_space_critical.configuration.sample_period_in_minutes
        threshold                     = var.k8s_pvc_anomalies.low_disk_space_critical.configuration.threshold
      }
    }
  }

  dynamic "low_disk_space_critical_percentage" {
    for_each = var.k8s_pvc_anomalies.low_disk_space_critical_percentage != null ? [1] : []
    content {
      enabled = var.k8s_pvc_anomalies.low_disk_space_critical_percentage.enabled
      configuration {
        observation_period_in_minutes = var.k8s_pvc_anomalies.low_disk_space_critical_percentage.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_pvc_anomalies.low_disk_space_critical_percentage.configuration.sample_period_in_minutes
        threshold                     = var.k8s_pvc_anomalies.low_disk_space_critical_percentage.configuration.threshold
      }
    }
  }
}

resource "dynatrace_k8s_workload_anomalies" "this" {
  scope = var.k8s_workload_anomalies.scope

  dynamic "container_restarts" {
    for_each = var.k8s_workload_anomalies.container_restarts != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.container_restarts.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.container_restarts.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.container_restarts.configuration.sample_period_in_minutes
        threshold                     = var.k8s_workload_anomalies.container_restarts.configuration.threshold
      }
    }
  }

  dynamic "deployment_stuck" {
    for_each = var.k8s_workload_anomalies.deployment_stuck != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.deployment_stuck.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.deployment_stuck.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.deployment_stuck.configuration.sample_period_in_minutes
      }
    }
  }

  dynamic "not_all_pods_ready" {
    for_each = var.k8s_workload_anomalies.not_all_pods_ready != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.not_all_pods_ready.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.not_all_pods_ready.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.not_all_pods_ready.configuration.sample_period_in_minutes
      }
    }
  }

  dynamic "pending_pods" {
    for_each = var.k8s_workload_anomalies.pending_pods != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.pending_pods.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.pending_pods.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.pending_pods.configuration.sample_period_in_minutes
        threshold                     = var.k8s_workload_anomalies.pending_pods.configuration.threshold
      }
    }
  }

  dynamic "pod_stuck_in_terminating" {
    for_each = var.k8s_workload_anomalies.pod_stuck_in_terminating != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.pod_stuck_in_terminating.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.pod_stuck_in_terminating.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.pod_stuck_in_terminating.configuration.sample_period_in_minutes
      }
    }
  }

  dynamic "workload_without_ready_pods" {
    for_each = var.k8s_workload_anomalies.workload_without_ready_pods != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.workload_without_ready_pods.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.workload_without_ready_pods.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.workload_without_ready_pods.configuration.sample_period_in_minutes
      }
    }
  }

  dynamic "high_cpu_throttling" {
    for_each = var.k8s_workload_anomalies.high_cpu_throttling != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.high_cpu_throttling.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.high_cpu_throttling.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.high_cpu_throttling.configuration.sample_period_in_minutes
        threshold                     = var.k8s_workload_anomalies.high_cpu_throttling.configuration.threshold
      }
    }
  }

  dynamic "high_cpu_usage" {
    for_each = var.k8s_workload_anomalies.high_cpu_usage != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.high_cpu_usage.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.high_cpu_usage.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.high_cpu_usage.configuration.sample_period_in_minutes
        threshold                     = var.k8s_workload_anomalies.high_cpu_usage.configuration.threshold
      }
    }
  }

  dynamic "high_memory_usage" {
    for_each = var.k8s_workload_anomalies.high_memory_usage != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.high_memory_usage.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.high_memory_usage.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.high_memory_usage.configuration.sample_period_in_minutes
        threshold                     = var.k8s_workload_anomalies.high_memory_usage.configuration.threshold
      }
    }
  }

  dynamic "job_failure_events" {
    for_each = var.k8s_workload_anomalies.job_failure_events != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.job_failure_events.enabled
    }
  }

  dynamic "oom_kills" {
    for_each = var.k8s_workload_anomalies.oom_kills != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.oom_kills.enabled
    }
  }

  dynamic "pod_backoff_events" {
    for_each = var.k8s_workload_anomalies.pod_backoff_events != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.pod_backoff_events.enabled
    }
  }

  dynamic "pod_eviction_events" {
    for_each = var.k8s_workload_anomalies.pod_eviction_events != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.pod_eviction_events.enabled
    }
  }

  dynamic "pod_preemption_events" {
    for_each = var.k8s_workload_anomalies.pod_preemption_events != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.pod_preemption_events.enabled
    }
  }
}
resource "dynatrace_metric_events" "this" {
  enabled                    = var.metric_events.enabled
  event_entity_dimension_key = var.metric_events.event_entity_dimension_key
  summary                    = var.metric_events.summary

  event_template {
    description = var.metric_events.event_template.description
    davis_merge = var.metric_events.event_template.davis_merge
    event_type  = var.metric_events.event_template.event_type
    title       = var.metric_events.event_template.title
  }

  model_properties {
    type               = var.metric_events.model_properties.type
    alert_condition    = var.metric_events.model_properties.alert_condition
    alert_on_no_data   = var.metric_events.model_properties.alert_on_no_data
    dealerting_samples = var.metric_events.model_properties.dealerting_samples
    samples            = var.metric_events.model_properties.samples
    threshold          = var.metric_events.model_properties.threshold
    violating_samples  = var.metric_events.model_properties.violating_samples
  }

  query_definition {
    type        = var.metric_events.query_definition.type
    aggregation = var.metric_events.query_definition.aggregation
    metric_key  = var.metric_events.query_definition.metric_key

    dimension_filter {
      dynamic "filter" {
        for_each = var.metric_events.query_definition.dimension_filter
        content {
          dimension_key   = filter.value.dimension_key
          dimension_value = filter.value.dimension_value
        }
      }
    }

    entity_filter {
      dimension_key = var.metric_events.query_definition.entity_filter.dimension_key

      conditions {
        dynamic "condition" {
          for_each = var.metric_events.query_definition.entity_filter.conditions
          content {
            type     = condition.value.type
            operator = condition.value.operator
            value    = condition.value.value
          }
        }
      }
    }
  }
}
resource "dynatrace_mobile_app_anomalies" "this" {
  scope = var.mobile_app_anomalies.scope

  dynamic "error_rate_increase" {
    for_each = var.mobile_app_anomalies.error_rate_increase[*]
    content {
      enabled        = error_rate_increase.value.enabled
      detection_mode = error_rate_increase.value.detection_mode

      dynamic "error_rate_increase_fixed" {
        for_each = error_rate_increase.value.error_rate_increase_fixed[*]
        content {
          sensitivity        = error_rate_increase_fixed.value.sensitivity
          threshold_absolute = error_rate_increase_fixed.value.threshold_absolute
        }
      }
    }
  }

  dynamic "slow_user_actions" {
    for_each = var.mobile_app_anomalies.slow_user_actions[*]
    content {
      enabled        = slow_user_actions.value.enabled
      detection_mode = slow_user_actions.value.detection_mode

      dynamic "slow_user_actions_fixed" {
        for_each = slow_user_actions.value.slow_user_actions_fixed[*]
        content {
          sensitivity = slow_user_actions_fixed.value.sensitivity

          dynamic "duration_avoid_overalerting" {
            for_each = slow_user_actions_fixed.value.duration_avoid_overalerting[*]
            content {
              min_action_rate = duration_avoid_overalerting.value.min_action_rate
            }
          }

          dynamic "duration_threshold_all_fixed" {
            for_each = slow_user_actions_fixed.value.duration_threshold_all_fixed[*]
            content {
              duration_threshold = duration_threshold_all_fixed.value.duration_threshold
            }
          }

          dynamic "duration_threshold_slowest" {
            for_each = slow_user_actions_fixed.value.duration_threshold_slowest[*]
            content {
              duration_threshold = duration_threshold_slowest.value.duration_threshold
            }
          }
        }
      }
    }
  }

  dynamic "unexpected_high_load" {
    for_each = var.mobile_app_anomalies.unexpected_high_load[*]
    content {
      enabled              = unexpected_high_load.value.enabled
      threshold_percentage = unexpected_high_load.value.threshold_percentage
    }
  }

  dynamic "unexpected_low_load" {
    for_each = var.mobile_app_anomalies.unexpected_low_load[*]
    content {
      enabled = unexpected_low_load.value.enabled
    }
  }
}

resource "dynatrace_mobile_app_crash_rate" "this" {
  application_id = var.mobile_app_crash_rate.application_id

  dynamic "crash_rate_increase" {
    for_each = var.mobile_app_crash_rate.crash_rate_increase[*]
    content {
      enabled        = crash_rate_increase.value.enabled
      detection_mode = crash_rate_increase.value.detection_mode

      dynamic "crash_rate_increase_fixed" {
        for_each = crash_rate_increase.value.crash_rate_increase_fixed[*]
        content {
          absolute_crash_rate = crash_rate_increase_fixed.value.absolute_crash_rate
          concurrent_users    = crash_rate_increase_fixed.value.concurrent_users
        }
      }
    }
  }
}

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
resource "dynatrace_vmware_anomalies" "vmware" {
  for_each = var.vmware_anomalies

  dropped_packets_detection {
    enabled        = each.value.dropped_packets_detection.enabled
    detection_mode = each.value.dropped_packets_detection.detection_mode

    dynamic "custom_thresholds" {
      for_each = each.value.dropped_packets_detection.custom_thresholds != null ? [each.value.dropped_packets_detection.custom_thresholds] : []
      content {
        dropped_packets_per_second = custom_thresholds.value.dropped_packets_per_second
      }
    }
  }

  esxi_high_cpu_detection {
    enabled = each.value.esxi_high_cpu_detection.enabled
  }

  esxi_high_memory_detection {
    enabled        = each.value.esxi_high_memory_detection.enabled
    detection_mode = each.value.esxi_high_memory_detection.detection_mode

    dynamic "custom_thresholds" {
      for_each = each.value.esxi_high_memory_detection.custom_thresholds != null ? [each.value.esxi_high_memory_detection.custom_thresholds] : []
      content {
        compression_decompression_rate = custom_thresholds.value.compression_decompression_rate
      }
    }
  }

  guest_cpu_limit_detection {
    enabled        = each.value.guest_cpu_limit_detection.enabled
    detection_mode = each.value.guest_cpu_limit_detection.detection_mode

    dynamic "custom_thresholds" {
      for_each = each.value.guest_cpu_limit_detection.custom_thresholds != null ? [each.value.guest_cpu_limit_detection.custom_thresholds] : []
      content {
        host_cpu_usage_percentage = custom_thresholds.value.host_cpu_usage_percentage
        vm_cpu_ready_percentage   = custom_thresholds.value.vm_cpu_ready_percentage
        vm_cpu_usage_percentage   = custom_thresholds.value.vm_cpu_usage_percentage
      }
    }
  }

  low_datastore_space_detection {
    enabled = each.value.low_datastore_space_detection.enabled
  }

  overloaded_storage_detection {
    enabled        = each.value.overloaded_storage_detection.enabled
    detection_mode = each.value.overloaded_storage_detection.detection_mode

    dynamic "custom_thresholds" {
      for_each = each.value.overloaded_storage_detection.custom_thresholds != null ? [each.value.overloaded_storage_detection.custom_thresholds] : []
      content {
        command_aborts_number = custom_thresholds.value.command_aborts_number
      }
    }
  }

  slow_physical_storage_detection {
    enabled        = each.value.slow_physical_storage_detection.enabled
    detection_mode = each.value.slow_physical_storage_detection.detection_mode

    dynamic "custom_thresholds" {
      for_each = each.value.slow_physical_storage_detection.custom_thresholds != null ? [each.value.slow_physical_storage_detection.custom_thresholds] : []
      content {
        avg_read_write_latency  = custom_thresholds.value.avg_read_write_latency
        peak_read_write_latency = custom_thresholds.value.peak_read_write_latency
      }
    }
  }

  undersized_storage_detection {
    enabled = each.value.undersized_storage_detection.enabled
  }
}

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
