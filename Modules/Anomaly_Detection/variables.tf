variable "disk_anomalies" {
  description = "List of disk anomalies configurations"
  type = map(object({
    scope = string
    disk = map(object({
      disk_low_space_detection = object({
        enabled = bool
        # Attributes for disk_low_space_detection
      })
      disk_slow_writes_and_reads_detection = object({
        enabled = bool
        # Attributes for disk_slow_writes_and_reads_detection
      })
      disk_low_inodes_detection = object({
        enabled = bool
        # Attributes for disk_low_inodes_detection
      })
    }))
  }))
}

variable "disk_anomaly_rules" {
  description = "List of disk anomaly rules configurations"
  type = map(object({
    name    = string
    enabled = bool
    metric  = string
    disk_name_filter = object({
      operator = string
      # Disk name filter attributes
    })
    sample_limit = object({
      samples           = number
      violating_samples = number
      # Sample limit attributes
    })
  }))
}

variable "disk_edge_detectors" {
  description = "List of disk edge anomaly detectors configurations"
  type = map(object({
    policy_name = string
    enabled     = bool
    event_properties = object({
      event_propertie = object({
        metadata_key   = string
        metadata_value = string
      })
    })
    alerts = object({
      alert = object({
        trigger = string
        # Alert attributes
      })
    })
  }))
}

variable "disk_specific_anomalies" {
  description = "List of specific disk anomalies configurations"
  type = map(object({
    disk_id                                  = string
    override_disk_low_space_detection        = bool
    override_low_inodes_detection            = bool
    override_slow_writes_and_reads_detection = bool
    disk_low_space_detection = object({
      enabled = bool
      # Attributes for disk_low_space_detection
    })
    disk_low_inodes_detection = object({
      enabled = bool
      # Attributes for disk_low_inodes_detection
    })
  }))
}

variable "ec_2_candidate_high_cpu_detection" {
  type = object({
    enabled        = bool
    detection_mode = string
    custom_thresholds = object({
      cpu_usage = number
    })
  })
  default = null
}

variable "elb_high_connection_errors_detection" {
  type = object({
    enabled        = bool
    detection_mode = string
    custom_thresholds = object({
      connection_errors_per_minute = number
    })
  })
  default = null
}

variable "lambda_high_error_rate_detection" {
  type = object({
    enabled        = bool
    detection_mode = string
    custom_thresholds = object({
      failed_invocations_rate = number
    })
  })
  default = null
}

variable "rds_high_cpu_detection" {
  type = object({
    enabled = bool
  })
  default = null
}

variable "rds_high_memory_detection" {
  type = object({
    enabled        = bool
    detection_mode = string
    custom_thresholds = object({
      free_memory = number
      swap_usage  = number
    })
  })
  default = null
}

variable "rds_high_write_read_latency_detection" {
  type = object({
    enabled        = bool
    detection_mode = string
    custom_thresholds = object({
      read_write_latency = number
    })
  })
  default = null
}

variable "rds_low_storage_detection" {
  type = object({
    enabled = bool
  })
  default = null
}

variable "rds_restarts_sequence_detection" {
  type = object({
    enabled = bool
  })
  default = null
}

variable "custom_app_scope" {
  type = string
}

variable "error_rate_increase" {
  type = object({
    enabled        = bool
    detection_mode = string
    error_rate_increase_fixed = object({
      sensitivity        = string
      threshold_absolute = number
    })
  })
  default = null
}

variable "slow_user_actions" {
  type = object({
    enabled = bool
  })
  default = null
}

variable "unexpected_high_load" {
  type = object({
    enabled              = bool
    threshold_percentage = number
  })
  default = null
}

variable "unexpected_low_load" {
  type = object({
    enabled              = bool
    threshold_percentage = number
  })
  default = null
}

variable "crash_rate_increase" {
  type = object({
    enabled        = bool
    detection_mode = string
    crash_rate_increase_fixed = object({
      absolute_crash_rate = number
      concurrent_users    = number
    })
  })
  default = null
}

variable "database_scope" {
  type = string
}

variable "database_connections" {
  type = object({
    enabled             = bool
    max_failed_connects = number
    time_period         = number
  })
  default = null
}

variable "failure_rate" {
  type = object({
    enabled        = bool
    detection_mode = string
    fixed_detection = object({
      sensitivity = string
      threshold   = number
      over_alerting_protection = object({
        minutes_abnormal_state = number
        requests_per_minute    = number
      })
    })
  })
  default = null
}

variable "load_drops" {
  type = object({
    enabled = bool
  })
  default = null
}

variable "load_spikes" {
  type = object({
    enabled = bool
  })
  default = null
}

variable "response_time" {
  type = object({
    enabled        = bool
    detection_mode = string
    fixed_detection = object({
      sensitivity = string
      over_alerting_protection = object({
        minutes_abnormal_state = number
        requests_per_minute    = number
      })
      response_time_all = object({
        degradation_milliseconds = number
      })
      response_time_slowest = object({
        slowest_degradation_milliseconds = number
      })
    })
  })
  default = null
}
variable "frequent_issues" {
  description = "Settings for frequent issues detection"
  type = object({
    detect_apps  = bool
    detect_txn   = bool
    detect_infra = bool
  })
}

variable "host_anomalies" {
  description = "Settings for host and network anomaly detection"
  type = object({
    scope = string
    host = object({
      connection_lost_detection = optional(object({
        enabled               = bool
        on_graceful_shutdowns = string
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
    })
    network = object({
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
    })
  })
}

variable "k8s_cluster_anomalies" {
  type = object({
    scope = string
    cpu_requests_saturation = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))
    memory_requests_saturation = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))
    monitoring_issues = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
      })
    }))
    pods_saturation = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))
    readiness_issues = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
      })
    }))
  })
}

variable "k8s_namespace_anomalies" {
  type = object({
    scope = string
    cpu_limits_quota_saturation = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))
    cpu_requests_quota_saturation = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))
    memory_limits_quota_saturation = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))
    memory_requests_quota_saturation = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))
    pods_quota_saturation = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))
  })
}
variable "k8s_node_anomalies" {
  type = object({
    scope = string
    cpu_requests_saturation = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))
    memory_requests_saturation = optional(object({
      enabled = bool
    }))
    pods_saturation = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))
    readiness_issues = optional(object({
      enabled = bool
    }))
    node_problematic_condition = optional(object({
      enabled = bool
    }))
  })
}

variable "k8s_pvc_anomalies" {
  type = object({
    scope = string
    low_disk_space_critical = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))
    low_disk_space_critical_percentage = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))
  })
}
variable "k8s_workload_anomalies" {
  type = object({
    scope = string

    container_restarts = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    deployment_stuck = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
      })
    }))

    not_all_pods_ready = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
      })
    }))

    pending_pods = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    pod_stuck_in_terminating = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
      })
    }))

    workload_without_ready_pods = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
      })
    }))

    high_cpu_throttling = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    high_cpu_usage = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    high_memory_usage = optional(object({
      enabled = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    job_failure_events = optional(object({
      enabled = bool
    }))

    oom_kills = optional(object({
      enabled = bool
    }))

    pod_backoff_events = optional(object({
      enabled = bool
    }))

    pod_eviction_events = optional(object({
      enabled = bool
    }))

    pod_preemption_events = optional(object({
      enabled = bool
    }))
  })
}

variable "metric_events" {
  type = object({
    enabled                    = bool
    event_entity_dimension_key = string
    summary                    = string

    event_template = object({
      description = string
      davis_merge = bool
      event_type  = string
      title       = string
    })

    model_properties = object({
      type               = string
      alert_condition    = string
      alert_on_no_data   = bool
      dealerting_samples = number
      samples            = number
      threshold          = number
      violating_samples  = number
    })

    query_definition = object({
      type        = string
      aggregation = string
      metric_key  = string

      dimension_filter = list(object({
        dimension_key   = string
        dimension_value = string
      }))

      entity_filter = object({
        dimension_key = string
        conditions = list(object({
          type     = string
          operator = string
          value    = string
        }))
      })
    })
  })
}
variable "mobile_app_anomalies" {
  type = object({
    scope = string
    error_rate_increase = list(object({
      enabled        = bool
      detection_mode = string
      error_rate_increase_fixed = list(object({
        sensitivity        = string
        threshold_absolute = number
      }))
    }))
    slow_user_actions = list(object({
      enabled        = bool
      detection_mode = string
      slow_user_actions_fixed = list(object({
        sensitivity = string
        duration_avoid_overalerting = list(object({
          min_action_rate = number
        }))
        duration_threshold_all_fixed = list(object({
          duration_threshold = number
        }))
        duration_threshold_slowest = list(object({
          duration_threshold = number
        }))
      }))
    }))
    unexpected_high_load = list(object({
      enabled              = bool
      threshold_percentage = number
    }))
    unexpected_low_load = list(object({
      enabled = bool
    }))
  })
}

variable "mobile_app_crash_rate" {
  type = object({
    application_id = string
    crash_rate_increase = list(object({
      enabled        = bool
      detection_mode = string
      crash_rate_increase_fixed = list(object({
        absolute_crash_rate = number
        concurrent_users    = number
      }))
    }))
  })
}

variable "service_anomalies" {
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
}

variable "vmware_anomalies" {
  description = "Map of VMware anomaly detection configurations"
  type = map(object({
    dropped_packets_detection = object({
      enabled        = bool
      detection_mode = string
      custom_thresholds = optional(object({
        dropped_packets_per_second = number
      }))
    })
    esxi_high_cpu_detection = object({
      enabled = bool
    })
    esxi_high_memory_detection = object({
      enabled        = bool
      detection_mode = string
      custom_thresholds = optional(object({
        compression_decompression_rate = number
      }))
    })
    guest_cpu_limit_detection = object({
      enabled        = bool
      detection_mode = string
      custom_thresholds = optional(object({
        host_cpu_usage_percentage = number
        vm_cpu_ready_percentage   = number
        vm_cpu_usage_percentage   = number
      }))
    })
    low_datastore_space_detection = object({
      enabled = bool
    })
    overloaded_storage_detection = object({
      enabled        = bool
      detection_mode = string
      custom_thresholds = optional(object({
        command_aborts_number = number
      }))
    })
    slow_physical_storage_detection = object({
      enabled        = bool
      detection_mode = string
      custom_thresholds = optional(object({
        avg_read_write_latency  = number
        peak_read_write_latency = number
      }))
    })
    undersized_storage_detection = object({
      enabled = bool
    })
  }))
}

variable "web_app_anomalies" {
  description = "Map of Web App anomaly detection configurations"
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
}
