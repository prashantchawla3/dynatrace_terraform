

resource "dynatrace_disk_anomalies_v2" "disk_anomalies" {
  scope = "environment"
  disk {
    disk_low_inodes_detection {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds {
        free_inodes_percentage = 5
      }
    }
    disk_low_space_detection {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds {
        free_space_percentage = 3
      }
    }
    disk_slow_writes_and_reads_detection {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds {
        write_and_read_time = 200
      }
    }
  }
}

resource "dynatrace_disk_anomaly_rules" "disk_anomaly_rules" {
  name              = "disk_anomaly_rules"
  enabled           = false
  host_group_id     = "HOST_GROUP-1234567890000000"
  metric            = "LOW_DISK_SPACE"
  threshold_percent = 10
  disk_name_filter {
    operator = "CONTAINS"
    value    = "disk_anomaly_rules"
  }
  sample_limit {
    samples           = 3
    violating_samples = 3
  }
}

resource "dynatrace_disk_edge_anomaly_detectors" "disk_edge_anomaly_detectors" {
  enabled           = true
  disk_name_filters = ["$eq(/)"]
  operating_system  = ["WINDOWS", "LINUX"]
  policy_name       = "disk_edge_anomaly_detectors"
  scope             = "environment"
  alerts {
    alert {
      threshold_percent = 10
      trigger           = "AVAILABLE_DISK_SPACE_PERCENT_BELOW"
      sample_count_thresholds {
        dealerting_evaluation_window = 30
        dealerting_samples           = 24
        violating_evaluation_window  = 30
        violating_samples            = 18
      }
    }
  }
  event_properties {
    event_propertie {
      metadata_key   = "ExampleKey"
      metadata_value = "ExampleValue"
    }
  }
}

resource "dynatrace_disk_specific_anomalies_v2" "disk_specific_anomalies" {
  disk_id                                  = "DISK-1234567890000000"
  override_disk_low_space_detection        = true
  override_low_inodes_detection            = true
  override_slow_writes_and_reads_detection = true
  disk_low_inodes_detection {
    enabled        = true
    detection_mode = "custom"
    custom_thresholds {
      free_inodes_percentage = 1
    }
  }
  disk_low_space_detection {
    enabled        = true
    detection_mode = "custom"
    custom_thresholds {
      free_space_percentage = 1
    }
  }
  disk_slow_writes_and_reads_detection {
    enabled        = true
    detection_mode = "custom"
    custom_thresholds {
      write_and_read_time = 300
    }
  }
}

resource "dynatrace_frequent_issues" "frequent_issues" {
  detect_apps  = true
  detect_txn   = true
  detect_infra = true
}

resource "dynatrace_host_anomalies_v2" "host_anomalies" {
  scope = var.host_anomalies_scope
  host {
    connection_lost_detection {
      enabled               = true
      on_graceful_shutdowns = "DONT_ALERT_ON_GRACEFUL_SHUTDOWN"
    }
    high_cpu_saturation_detection {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds {
        cpu_saturation = 95
        event_thresholds {
          dealerting_evaluation_window = 30
          dealerting_samples           = 30
          violating_evaluation_window  = 30
          violating_samples            = 18
        }
      }
    }
    high_gc_activity_detection {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds {
        gc_suspension_percentage = 25
        gc_time_percentage       = 40
        event_thresholds {
          dealerting_evaluation_window = 30
          dealerting_samples           = 30
          violating_evaluation_window  = 30
          violating_samples            = 18
        }
      }
    }
    high_memory_detection {
      enabled        = true
      detection_mode = "auto"
    }
    high_system_load_detection {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds {
        system_load = 1
        event_thresholds {
          dealerting_evaluation_window = 30
          dealerting_samples           = 30
          violating_evaluation_window  = 6
          violating_samples            = 1
        }
      }
    }
    out_of_memory_detection {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds {
        out_of_memory_exceptions_number = 1
        event_thresholds {
          dealerting_evaluation_window = 30
          dealerting_samples           = 30
          violating_evaluation_window  = 6
          violating_samples            = 1
        }
      }
    }
    out_of_threads_detection {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds {
        out_of_threads_exceptions_number = 1
        event_thresholds {
          dealerting_evaluation_window = 30
          dealerting_samples           = 30
          violating_evaluation_window  = 6
          violating_samples            = 1
        }
      }
    }
  }
  network {
    high_network_detection {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds {
        errors_percentage = 90
        event_thresholds {
          dealerting_evaluation_window = 30
          dealerting_samples           = 30
          violating_evaluation_window  = 30
          violating_samples            = 18
        }
      }
    }
    network_dropped_packets_detection {
      enabled        = true
      detection_mode = "auto"
    }
    network_errors_detection {
      enabled        = true
      detection_mode = "auto"
    }
    network_high_retransmission_detection {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds {
        retransmission_rate_percentage          = 10
        retransmitted_packets_number_per_minute = 10
        event_thresholds {
          dealerting_evaluation_window = 30
          dealerting_samples           = 30
          violating_evaluation_window  = 30
          violating_samples            = 18
        }
      }
    }
    network_tcp_problems_detection {
      enabled        = true
      detection_mode = "auto"
    }
  }
}

resource "dynatrace_k8s_cluster_anomalies" "k8s_cluster_anomalies" {
  scope = "environment"
  cpu_requests_saturation {
    enabled = true
    configuration {
      observation_period_in_minutes = 20
      sample_period_in_minutes      = 15
      threshold                     = 95
    }
  }
  memory_requests_saturation {
    enabled = true
    configuration {
      observation_period_in_minutes = 20
      sample_period_in_minutes      = 15
      threshold                     = 95
    }
  }
  monitoring_issues {
    enabled = true
    configuration {
      observation_period_in_minutes = 35
      sample_period_in_minutes      = 20
    }
  }
  pods_saturation {
    enabled = true
    configuration {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
      threshold                     = 95
    }
  }
  readiness_issues {
    enabled = true
    configuration {
      observation_period_in_minutes = 5
      sample_period_in_minutes      = 4
    }
  }
}

resource "dynatrace_k8s_namespace_anomalies" "k8s_namespace_anomalies" {
  scope = "environment"
  cpu_limits_quota_saturation {
    enabled = true
    configuration {
      observation_period_in_minutes = 15
      sample_period_in_minutes      = 10
      threshold                     = 90
    }
  }
  cpu_requests_quota_saturation {
    enabled = true
    configuration {
      observation_period_in_minutes = 15
      sample_period_in_minutes      = 10
      threshold                     = 90
    }
  }
  memory_limits_quota_saturation {
    enabled = true
    configuration {
      observation_period_in_minutes = 15
      sample_period_in_minutes      = 10
      threshold                     = 90
    }
  }
  memory_requests_quota_saturation {
    enabled = true
    configuration {
      observation_period_in_minutes = 15
      sample_period_in_minutes      = 10
      threshold                     = 90
    }
  }
  pods_quota_saturation {
    enabled = true
    configuration {
      observation_period_in_minutes = 15
      sample_period_in_minutes      = 10
      threshold                     = 90
    }
  }
}

resource "dynatrace_k8s_node_anomalies" "k8s_node_anomalies" {
  scope = "environment"
  cpu_requests_saturation {
    enabled = true
    configuration {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
      threshold                     = 95
    }
  }
  memory_requests_saturation {
    enabled = false
  }
  pods_saturation {
    enabled = true
    configuration {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
      threshold                     = 95
    }
  }
  readiness_issues {
    enabled = false
  }
  node_problematic_condition {
    enabled = false
  }
}

resource "dynatrace_k8s_pvc_anomalies" "k8s_pvc_anomalies" {
  scope = "environment"
  low_disk_space_critical {
    enabled = true
    configuration {
      observation_period_in_minutes = 5
      sample_period_in_minutes      = 3
      threshold                     = 100
    }
  }
  low_disk_space_critical_percentage {
    enabled = true
    configuration {
      observation_period_in_minutes = 5
      sample_period_in_minutes      = 3
      threshold                     = 10
    }
  }
}

resource "dynatrace_k8s_workload_anomalies" "k8s_workload_anomalies" {
  scope = "environment"
  container_restarts {
    enabled = true
    configuration {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
      threshold                     = 2
    }
  }
  deployment_stuck {
    enabled = true
    configuration {
      observation_period_in_minutes = 5
      sample_period_in_minutes      = 4
    }
  }
  not_all_pods_ready {
    enabled = true
    configuration {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
    }
  }
  pending_pods {
    enabled = true
    configuration {
      observation_period_in_minutes = 16
      sample_period_in_minutes      = 11
      threshold                     = 2
    }
  }
  pod_stuck_in_terminating {
    enabled = true
    configuration {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
    }
  }
  workload_without_ready_pods {
    enabled = true
    configuration {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
    }
  }
  high_cpu_throttling {
    enabled = true
    configuration {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
      threshold                     = 2
    }
  }
  high_cpu_usage {
    enabled = true
    configuration {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
      threshold                     = 2
    }
  }
  high_memory_usage {
    enabled = true
    configuration {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
      threshold                     = 2
    }
  }
  job_failure_events {
    enabled = true
  }
  oom_kills {
    enabled = true
  }
  pod_backoff_events {
    enabled = true
  }
  pod_eviction_events {
    enabled = true
  }
  pod_preemption_events {
    enabled = true
  }
}

resource "dynatrace_metric_events" "metric_events" {
  enabled                    = true
  event_entity_dimension_key = "dt.entity.host"
  summary                    = "metric_events"
  event_template {
    description = "some description"
    davis_merge = false
    event_type  = "CUSTOM_ALERT"
    title       = "metric_events"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    alert_on_no_data   = false
    dealerting_samples = 5
    samples            = 5
    threshold          = 1
    violating_samples  = 3
  }
  query_definition {
    type        = "METRIC_KEY"
    aggregation = "AVG"
    metric_key  = "builtin:host.disk.usedPct"
    dimension_filter {
      filter {
        dimension_key   = "dt.entity.host"
        dimension_value = "HOST-9DDF1200A29EFAC9"
      }
      filter {
        dimension_key   = "dt.entity.disk.name"
        dimension_value = "/local"
      }
      filter {
        dimension_key   = "dt.entity.disk"
        dimension_value = "DISK-3DC3FC42FBB07595"
      }
    }
    entity_filter {
      dimension_key = "dt.entity.host"
      conditions {
        condition {
          type     = "NAME"
          operator = "EQUALS"
          value    = "HOST-80FF882B3215BF1A"
        }
        condition {
          type     = "ENTITY_ID"
          operator = "EQUALS"
          value    = "HOST-32D0DB4904B28FB3"
        }
        condition {
          type     = "MANAGEMENT_ZONE"
          operator = "EQUALS"
          value    = "-189204438944455158"
        }
        condition {
          type     = "HOST_GROUP_NAME"
          operator = "EQUALS"
          value    = "HOST-42FDD00356069724"
        }
      }
    }
  }
}
resource "dynatrace_mobile_app_anomalies" "mobile_app_anomalies" {
  scope = "MOBILE_APPLICATION-1234567890000000"
  error_rate_increase {
    enabled        = true
    detection_mode = "fixed"
    error_rate_increase_fixed {
      sensitivity        = "medium"
      threshold_absolute = 6
    }
  }
  slow_user_actions {
    enabled        = true
    detection_mode = "fixed"
    slow_user_actions_fixed {
      sensitivity = "high"
      duration_avoid_overalerting {
        min_action_rate = 12
      }
      duration_threshold_all_fixed {
        duration_threshold = 200
      }
      duration_threshold_slowest {
        duration_threshold = 900
      }
    }
  }
  unexpected_high_load {
    enabled              = true
    threshold_percentage = 300
  }
  unexpected_low_load {
    enabled = false
  }
}

resource "dynatrace_mobile_app_crash_rate" "mobile_app_crash_rate" {
  application_id = "MOBILE_APPLICATION-1234567890000000"
  crash_rate_increase {
    enabled        = true
    detection_mode = "fixed"
    crash_rate_increase_fixed {
      absolute_crash_rate = 25
      concurrent_users    = 200
    }
  }
}

resource "dynatrace_service_anomalies_v2" "service_anomalies" {
  scope = "SERVICE-1234567890000000"
  failure_rate {
    enabled        = true
    detection_mode = "fixed"
    fixed_detection {
      sensitivity = "high"
      threshold   = 5
      over_alerting_protection {
        minutes_abnormal_state = 1
        requests_per_minute    = 10
      }
    }
  }
  load_drops {
    enabled                = true
    load_drop_percent      = 50
    minutes_abnormal_state = 1
  }
  load_spikes {
    enabled                = true
    load_spike_percent     = 200
    minutes_abnormal_state = 1
  }
  response_time {
    enabled        = true
    detection_mode = "fixed"
    fixed_detection {
      sensitivity = "high"
      over_alerting_protection {
        minutes_abnormal_state = 1
        requests_per_minute    = 10
      }
      response_time_all {
        degradation_milliseconds = 100
      }
      response_time_slowest {
        slowest_degradation_milliseconds = 1000
      }
    }
  }
}

resource "dynatrace_vmware_anomalies" "vmware_anomalies" {
  dropped_packets_detection {
    enabled        = true
    detection_mode = "custom"
    custom_thresholds {
      dropped_packets_per_second = 4
    }
  }
  esxi_high_cpu_detection {
    enabled = false
  }
  esxi_high_memory_detection {
    enabled        = true
    detection_mode = "custom"
    custom_thresholds {
      compression_decompression_rate = 104
    }
  }
  guest_cpu_limit_detection {
    enabled        = true
    detection_mode = "custom"
    custom_thresholds {
      host_cpu_usage_percentage = 74
      vm_cpu_ready_percentage   = 13
      vm_cpu_usage_percentage   = 94
    }
  }
  low_datastore_space_detection {
    enabled = false
  }
  overloaded_storage_detection {
    enabled        = true
    detection_mode = "custom"
    custom_thresholds {
      command_aborts_number = 4
    }
  }
  slow_physical_storage_detection {
    enabled        = true
    detection_mode = "custom"
    custom_thresholds {
      avg_read_write_latency  = 204
      peak_read_write_latency = 304
    }
  }
  undersized_storage_detection {
    enabled = false
  }
}

resource "dynatrace_web_app_anomalies" "web_app_anomalies" {
  scope = "APPLICATION-1234567890000000"
  error_rate {
    enabled                   = true
    error_rate_detection_mode = "auto"
    error_rate_auto {
      absolute_increase = 10
      relative_increase = 70
      over_alerting_protection {
        actions_per_minute     = 12
        minutes_abnormal_state = 2
      }
    }
  }
  response_time {
    enabled        = true
    detection_mode = "fixed"
    response_time_fixed {
      sensitivity = "low"
      over_alerting_protection {
        actions_per_minute     = 10
        minutes_abnormal_state = 1
      }
      response_time_all {
        degradation_milliseconds = 100
      }
      response_time_slowest {
        slowest_degradation_milliseconds = 1000
      }
    }
  }
  traffic_drops {
    enabled = false
  }
  traffic_spikes {
    enabled = true
    traffic_spikes {
      minutes_abnormal_state   = 2
      traffic_spike_percentage = 250
    }
  }
}