disk_anomalies = {
  anomaly1 = {
    scope = "HOST-1234567890ABCDEF"  # Replace with a valid Dynatrace entity ID
    disk = {
      detection1 = {
        disk_low_space_detection = {
          enabled = true
          threshold = 10
          duration = "5m"
        }
        disk_slow_writes_and_reads_detection = {
          enabled = true
          threshold = 20
          duration = "10m"
        }
        disk_low_inodes_detection = {
          enabled = true
          threshold = 30
          duration = "15m"
        }
      }
    }
  }
  anomaly2 = {
    scope = "HOST-0987654321FEDCBA"  # Replace with a valid Dynatrace entity ID
    disk = {
      detection1 = {
        disk_low_space_detection = {
          enabled = false
          threshold = 10
          duration = "5m"
        }
        disk_slow_writes_and_reads_detection = {
          enabled = false
          threshold = 20
          duration = "10m"
        }
        disk_low_inodes_detection = {
          enabled = false
          threshold = 30
          duration = "15m"
        }
      }
    }
  }
}

disk_anomaly_rules = {
  rule1 = {
    name    = "valid-rule-name-1" # 3 to 60 characters
    enabled = true
    metric  = "metric1"
    disk_name_filter = {
      operator = "operator1"
    }
   sample_limit = {
  samples           = 30
  violating_samples = 10
}

  }
  rule2 = {
    name    = "valid-rule-name-2"
    enabled = false
    metric  = "metric2"
    disk_name_filter = {
      operator = "operator2"
    }
    sample_limit = {
  samples           = 30
  violating_samples = 10
}

  }
}

disk_edge_detectors = {
  detector1 = {
    policy_name = "policy1"
    enabled     = true
    event_properties = {
      event_propertie = {
        metadata_key   = "ExampleKey"
        metadata_value = "ExampleValue"
      }
    }
    alerts = {
      alert = {
        trigger = "AVAILABLE_DISK_SPACE_PERCENT_BELOW"
      sample_count_thresholds {
  violating_samples            = 3
  violating_evaluation_window  = 5
  dealerting_samples           = 4
  dealerting_evaluation_window = 5
}

      }
    }
  }
  detector2 = {
    policy_name = "policy2"
    enabled     = false
    event_properties = {
      event_propertie = {
        metadata_key   = "ExampleKey2"
        metadata_value = "ExampleValue2"
      }
    }
    alerts = {
      alert = {
        trigger = "AVAILABLE_DISK_SPACE_PERCENT_BELOW"
       sample_count_thresholds = {
  violating_samples            = 3
  violating_evaluation_window  = 5
  dealerting_samples           = 4
  dealerting_evaluation_window = 5
}

      }
    }
  }
}

disk_specific_anomalies = {
  specific_anomaly1 = {
    disk_id                           = "DISK-1234567890ABCDEF"  # Replace with a valid Dynatrace disk entity ID
    override_disk_low_space_detection = true
    override_low_inodes_detection     = true
    override_slow_writes_and_reads_detection = true
    disk_low_space_detection = {
      enabled = true
      threshold = 10
      duration = "5m"
    }
    disk_low_inodes_detection = {
      enabled = true
      threshold = 30
      duration = "15m"
    }
  }
  specific_anomaly2 = {
    disk_id                           = "DISK-0987654321FEDCBA"  # Replace with a valid Dynatrace disk entity ID
    override_disk_low_space_detection = false
    override_low_inodes_detection     = false
    override_slow_writes_and_reads_detection = false
    disk_low_space_detection = {
      enabled = false
      threshold = 10
      duration = "5m"
    }
    disk_low_inodes_detection = {
      enabled = false
      threshold = 30
      duration = "15m"
    }
  }
}

ec_2_candidate_high_cpu_detection = {
  enabled        = true
  detection_mode = "custom"
  custom_thresholds = {
    cpu_usage = 94
  }
}

elb_high_connection_errors_detection = {
  enabled        = true
  detection_mode = "custom"
  custom_thresholds = {
    connection_errors_per_minute = 9
  }
}

lambda_high_error_rate_detection = {
  enabled        = true
  detection_mode = "custom"
  custom_thresholds = {
    failed_invocations_rate = 4
  }
}

rds_high_cpu_detection = {
  enabled = false
}

rds_high_memory_detection = {
  enabled        = true
  detection_mode = "custom"
  custom_thresholds = {
    free_memory = 94
    swap_usage  = 4
  }
}

rds_high_write_read_latency_detection = {
  enabled        = true
  detection_mode = "custom"
  custom_thresholds = {
    read_write_latency = 194
  }
}

rds_low_storage_detection = {
  enabled = false
}

rds_restarts_sequence_detection = {
  enabled = false
}

custom_app_scope = "CUSTOM_APPLICATION-1234567890000000"

error_rate_increase = {
  enabled        = true
  detection_mode = "fixed"
  error_rate_increase_fixed = {
    sensitivity        = "low"
    threshold_absolute = 5
  }
}

slow_user_actions = {
  enabled = false
}

unexpected_high_load = {
  enabled             = true
  threshold_percentage = 300
}

unexpected_low_load = {
  enabled             = true
  threshold_percentage = 80
}

crash_rate_increase = {
  enabled        = true
  detection_mode = "fixed"
  crash_rate_increase_fixed = {
    absolute_crash_rate = 25
    concurrent_users    = 200
  }
}

database_scope = "environment"

database_connections = {
  enabled             = true
  max_failed_connects = 5
  time_period         = 5
}

failure_rate = {
  enabled        = true
  detection_mode = "fixed"
  fixed_detection = {
    sensitivity = "low"
    threshold   = 0
    over_alerting_protection = {
      minutes_abnormal_state = 1
      requests_per_minute    = 10
    }
  }
}

load_drops = {
  enabled = false
}

load_spikes = {
  enabled = false
}

response_time = {
  enabled        = true
  detection_mode = "fixed"
  fixed_detection = {
    sensitivity = "high"
    over_alerting_protection = {
      minutes_abnormal_state = 1
      requests_per_minute    = 15
    }
    response_time_all = {
      degradation_milliseconds = 15
    }
    response_time_slowest = {
      slowest_degradation_milliseconds = 23
    }
  }
}

frequent_issues = {
  detect_apps  = true
  detect_txn   = true
  detect_infra = true
}

host_anomalies = {
  scope = "HOST-1234567890000000"

  host = {
    connection_lost_detection = {
      enabled               = true
      on_graceful_shutdowns = "DONT_ALERT_ON_GRACEFUL_SHUTDOWN"
    }

    high_cpu_saturation_detection = {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds = {
        cpu_saturation = 95
        event_thresholds = {
          dealerting_evaluation_window = 30
          dealerting_samples           = 30
          violating_evaluation_window  = 30
          violating_samples            = 18
        }
      }
    }

    high_gc_activity_detection = {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds = {
        gc_suspension_percentage = 25
        gc_time_percentage       = 40
        event_thresholds = {
          dealerting_evaluation_window = 30
          dealerting_samples           = 30
          violating_evaluation_window  = 30
          violating_samples            = 18
        }
      }
    }

    high_memory_detection = {
      enabled        = true
      detection_mode = "auto"
    }

    high_system_load_detection = {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds = {
        system_load = 1
        event_thresholds = {
          dealerting_evaluation_window = 30
          dealerting_samples           = 30
          violating_evaluation_window  = 6
          violating_samples            = 1
        }
      }
    }

    out_of_memory_detection = {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds = {
        out_of_memory_exceptions_number = 1
        event_thresholds = {
          dealerting_evaluation_window = 30
          dealerting_samples           = 30
          violating_evaluation_window  = 6
          violating_samples            = 1
        }
      }
    }

    out_of_threads_detection = {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds = {
        out_of_threads_exceptions_number = 1
        event_thresholds = {
          dealerting_evaluation_window = 30
          dealerting_samples           = 30
          violating_evaluation_window  = 6
          violating_samples            = 1
        }
      }
    }
  }

  network = {
    high_network_detection = {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds = {
        errors_percentage = 90
        event_thresholds = {
          dealerting_evaluation_window = 30
          dealerting_samples           = 30
          violating_evaluation_window  = 30
          violating_samples            = 18
        }
      }
    }

    network_dropped_packets_detection = {
      enabled        = true
      detection_mode = "auto"
    }

    network_errors_detection = {
      enabled        = true
      detection_mode = "auto"
    }

    network_high_retransmission_detection = {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds = {
        retransmission_rate_percentage          = 10
        retransmitted_packets_number_per_minute = 10
        event_thresholds = {
          dealerting_evaluation_window = 30
          dealerting_samples           = 30
          violating_evaluation_window  = 30
          violating_samples            = 18
        }
      }
    }

    network_tcp_problems_detection = {
      enabled        = true
      detection_mode = "auto"
    }
  }
}
k8s_cluster_anomalies = {
  scope = "environment"

  cpu_requests_saturation = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 20
      sample_period_in_minutes      = 15
      threshold                     = 95
    }
  }

  memory_requests_saturation = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 20
      sample_period_in_minutes      = 15
      threshold                     = 95
    }
  }

  monitoring_issues = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 35
      sample_period_in_minutes      = 20
    }
  }

  pods_saturation = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
      threshold                     = 95
    }
  }

  readiness_issues = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 5
      sample_period_in_minutes      = 4
    }
  }
}

k8s_namespace_anomalies = {
  scope = "environment"

  cpu_limits_quota_saturation = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 15
      sample_period_in_minutes      = 10
      threshold                     = 90
    }
  }

  cpu_requests_quota_saturation = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 15
      sample_period_in_minutes      = 10
      threshold                     = 90
    }
  }

  memory_limits_quota_saturation = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 15
      sample_period_in_minutes      = 10
      threshold                     = 90
    }
  }

  memory_requests_quota_saturation = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 15
      sample_period_in_minutes      = 10
      threshold                     = 90
    }
  }

  pods_quota_saturation = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 15
      sample_period_in_minutes      = 10
      threshold                     = 90
    }
  }
}
k8s_node_anomalies = {
  scope = "environment"

  cpu_requests_saturation = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
      threshold                     = 95
    }
  }

  memory_requests_saturation = {
    enabled = false
  }

  pods_saturation = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
      threshold                     = 95
    }
  }

  readiness_issues = {
    enabled = false
  }

  node_problematic_condition = {
    enabled = false
  }
}

k8s_pvc_anomalies = {
  scope = "environment"

  low_disk_space_critical = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 5
      sample_period_in_minutes      = 3
      threshold                     = 100
    }
  }

  low_disk_space_critical_percentage = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 5
      sample_period_in_minutes      = 3
      threshold                     = 10
    }
  }
}
k8s_workload_anomalies = {
  scope = "environment"

  container_restarts = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
      threshold                     = 2
    }
  }

  deployment_stuck = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 5
      sample_period_in_minutes      = 4
    }
  }

  not_all_pods_ready = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
    }
  }

  pending_pods = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 16
      sample_period_in_minutes      = 11
      threshold                     = 2
    }
  }

  pod_stuck_in_terminating = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
    }
  }

  workload_without_ready_pods = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
    }
  }

  high_cpu_throttling = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
      threshold                     = 2
    }
  }

  high_cpu_usage = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
      threshold                     = 2
    }
  }

  high_memory_usage = {
    enabled = true
    configuration = {
      observation_period_in_minutes = 6
      sample_period_in_minutes      = 4
      threshold                     = 2
    }
  }

  job_failure_events = {
    enabled = true
  }

  oom_kills = {
    enabled = true
  }

  pod_backoff_events = {
    enabled = true
  }

  pod_eviction_events = {
    enabled = true
  }

  pod_preemption_events = {
    enabled = true
  }
}

metric_events = {
  enabled                    = true
  event_entity_dimension_key = "dt.entity.host"
  summary                    = "sample_name"

  event_template = {
    description = "some description"
    davis_merge = false
    event_type  = "CUSTOM_ALERT"
    title       = "sample_name"
  }

  model_properties = {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    alert_on_no_data   = false
    dealerting_samples = 5
    samples            = 5
    threshold          = 1
    violating_samples  = 3
  }

  query_definition = {
    type        = "METRIC_KEY"
    aggregation = "AVG"
    metric_key  = "builtin:host.disk.usedPct"

    dimension_filter = [
      { dimension_key = "dt.entity.host",      dimension_value = "HOST-9DDF1200A29EFAC9" },
      { dimension_key = "dt.entity.disk.name", dimension_value = "/local" },
      { dimension_key = "dt.entity.disk",      dimension_value = "DISK-3DC3FC42FBB07595" }
    ]

    entity_filter = {
      dimension_key = "dt.entity.host"
      conditions = [
        { type = "NAME",            operator = "EQUALS", value = "HOST-80FF882B3215BF1A" },
        { type = "ENTITY_ID",       operator = "EQUALS", value = "HOST-32D0DB4904B28FB3" },
        { type = "MANAGEMENT_ZONE", operator = "EQUALS", value = "-189204438944455158" },
        { type = "HOST_GROUP_NAME", operator = "EQUALS", value = "HOST-42FDD00356069724" }
      ]
    }
  }
}
mobile_app_anomalies = {
  scope = "MOBILE_APPLICATION-1234567890000000"

  error_rate_increase = [{
    enabled        = true
    detection_mode = "fixed"
    error_rate_increase_fixed = [{
      sensitivity        = "medium"
      threshold_absolute = 6
    }]
  }]

  slow_user_actions = [{
    enabled        = true
    detection_mode = "fixed"
    slow_user_actions_fixed = [{
      sensitivity = "high"
      duration_avoid_overalerting = [{
        min_action_rate = 12
      }]
      duration_threshold_all_fixed = [{
        duration_threshold = 200
      }]
      duration_threshold_slowest = [{
        duration_threshold = 900
      }]
    }]
  }]

  unexpected_high_load = [{
    enabled              = true
    threshold_percentage = 300
  }]

  unexpected_low_load = [{
    enabled = false
  }]
}

mobile_app_crash_rate = {
  application_id = "MOBILE_APPLICATION-1234567890000000"

  crash_rate_increase = [{
    enabled        = true
    detection_mode = "fixed"
    crash_rate_increase_fixed = [{
      absolute_crash_rate = 25
      concurrent_users    = 200
    }]
  }]
}

service_anomalies = {
  scope = "SERVICE-1234567890000000"

  failure_rate = [{
    enabled        = true
    detection_mode = "fixed"
    fixed_detection = [{
      sensitivity = "high"
      threshold   = 5
      over_alerting_protection = [{
        minutes_abnormal_state = 1
        requests_per_minute    = 10
      }]
    }]
  }]

  load_drops = [{
    enabled                = true
    load_drop_percent      = 50
    minutes_abnormal_state = 1
  }]

  load_spikes = [{
    enabled                = true
    load_spike_percent     = 200
    minutes_abnormal_state = 1
  }]

  response_time = [{
    enabled        = true
    detection_mode = "fixed"
    fixed_detection = [{
      sensitivity = "high"
      over_alerting_protection = [{
        minutes_abnormal_state = 1
        requests_per_minute    = 10
      }]
      response_time_all = [{
        degradation_milliseconds = 100
      }]
      response_time_slowest = [{
        slowest_degradation_milliseconds = 1000
      }]
    }]
  }]
}
vmware_anomalies = {
  example_vmware = {
    dropped_packets_detection = {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds = {
        dropped_packets_per_second = 4
      }
    }
    esxi_high_cpu_detection = {
      enabled = false
    }
    esxi_high_memory_detection = {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds = {
        compression_decompression_rate = 104
      }
    }
    guest_cpu_limit_detection = {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds = {
        host_cpu_usage_percentage = 74
        vm_cpu_ready_percentage   = 13
        vm_cpu_usage_percentage   = 94
      }
    }
    low_datastore_space_detection = {
      enabled = false
    }
    overloaded_storage_detection = {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds = {
        command_aborts_number = 4
      }
    }
    slow_physical_storage_detection = {
      enabled        = true
      detection_mode = "custom"
      custom_thresholds = {
        avg_read_write_latency  = 204
        peak_read_write_latency = 304
      }
    }
    undersized_storage_detection = {
      enabled = false
    }
  }
}

web_app_anomalies = {
  example_web_app = {
    scope = "APPLICATION-1234567890000000"
    error_rate = {
      enabled                   = true
      error_rate_detection_mode = "auto"
      error_rate_auto = {
        absolute_increase = 10
        relative_increase = 70
        over_alerting_protection = {
          actions_per_minute     = 12
          minutes_abnormal_state = 2
        }
      }
    }
    response_time = {
      enabled        = true
      detection_mode = "fixed"
      response_time_fixed = {
        sensitivity = "low"
        over_alerting_protection = {
          actions_per_minute     = 10
          minutes_abnormal_state = 1
        }
        response_time_all = {
          degradation_milliseconds = 100
        }
        response_time_slowest = {
          slowest_degradation_milliseconds = 1000
        }
      }
    }
    traffic_drops = {
      enabled = false
    }
    traffic_spikes = {
      enabled = true
      traffic_spikes = {
        minutes_abnormal_state   = 2
        traffic_spike_percentage = 250
      }
    }
  }
}
