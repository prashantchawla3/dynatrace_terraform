

variable "disk_anomalies" {
  description = "Configurations for disk anomaly detection including low space, slow reads/writes, and low inodes"
  type        = map(object({
    scope = string
    disk  = map(object({
      disk_low_space_detection = object({
        enabled = bool
        # Additional attributes for low space detection
      })
      disk_slow_writes_and_reads_detection = object({
        enabled = bool
        # Additional attributes for slow writes/reads detection
      })
      disk_low_inodes_detection = object({
        enabled = bool
        # Additional attributes for low inodes detection
      })
    }))
  }))
  default = {}
}

variable "disk_anomaly_rules" {
  description = "Configurations for disk anomaly rule-based filtering and limits"
  type        = map(object({
    name           = string
    enabled        = bool
    metric         = string
    disk_name_filter = object({
      operator = string
      # Additional disk name filter attributes
    })
    sample_limit = object({
      samples           = number
      violating_samples = number
      # Additional sample limit attributes
    })
  }))
  default = {}
}

variable "disk_edge_detectors" {
  description = "Configurations for disk edge anomaly detectors and alerting"
  type        = map(object({
    policy_name      = string
    enabled          = bool
    event_properties = object({
      event_propertie = object({
        metadata_key   = string
        metadata_value = string
      })
    })
    alerts = object({
      alert = object({
        trigger = string
        # Additional alerting attributes
      })
    })
  }))
  default = {}
}

variable "disk_specific_anomalies" {
  description = "Overrides for disk-specific anomaly detections and alert settings"
  type        = map(object({
    disk_id                                  = string
    override_disk_low_space_detection        = bool
    override_low_inodes_detection            = bool
    override_slow_writes_and_reads_detection = bool
    disk_low_space_detection = object({
      enabled = bool
      # Additional attributes
    })
    disk_low_inodes_detection = object({
      enabled = bool
      # Additional attributes
    })
  }))
  default = {}
}

variable "ec_2_candidate_high_cpu_detection" {
  description = "Anomaly detection config for EC2 instances with high CPU usage"
  type        = object({
    enabled         = bool
    detection_mode  = string
    custom_thresholds = object({
      cpu_usage = number
    })
  })
  default = null
}

variable "elb_high_connection_errors_detection" {
  description = "Detection for high connection errors in ELB resources"
  type        = object({
    enabled         = bool
    detection_mode  = string
    custom_thresholds = object({
      connection_errors_per_minute = number
    })
  })
  default = null
}

variable "lambda_high_error_rate_detection" {
  description = "Configuration for detecting high error rate in Lambda functions"
  type        = object({
    enabled         = bool
    detection_mode  = string
    custom_thresholds = object({
      failed_invocations_rate = number
    })
  })
  default = null
}

variable "rds_high_cpu_detection" {
  description = "Detects high CPU usage in RDS instances"
  type        = object({
    enabled = bool
  })
  default = null
}

variable "rds_high_memory_detection" {
  description = "Detects memory-related anomalies in RDS instances"
  type        = object({
    enabled         = bool
    detection_mode  = string
    custom_thresholds = object({
      free_memory = number
      swap_usage  = number
    })
  })
  default = null
}

variable "rds_high_write_read_latency_detection" {
  description = "Detects high latency for read/write operations in RDS"
  type        = object({
    enabled         = bool
    detection_mode  = string
    custom_thresholds = object({
      read_write_latency = number
    })
  })
  default = null
}

variable "rds_low_storage_detection" {
  description = "Detects low storage capacity in RDS instances"
  type        = object({
    enabled = bool
  })
  default = null
}

variable "rds_restarts_sequence_detection" {
  description = "Detects unusual restart sequences in RDS instances"
  type        = object({
    enabled = bool
  })
  default = null
}

variable "custom_app_scope" {
  description = "Scope tag for application-specific anomaly detection"
  type        = string
  default     = ""
}

variable "error_rate_increase" {
  description = "Configuration for detecting increases in application error rates"
  type        = object({
    enabled                     = bool
    detection_mode              = string
    error_rate_increase_fixed = object({
      sensitivity        = string
      threshold_absolute = number
    })
  })
  default = null
}

variable "slow_user_actions" {
  description = "Detects slow end-user interaction times in application services"
  type        = object({
    enabled = bool
  })
  default = null
}

variable "unexpected_high_load" {
  description = "Detects unusually high load spikes in traffic or resource usage"
  type        = object({
    enabled              = bool
    threshold_percentage = number
  })
  default = null
}

variable "unexpected_low_load" {
  description = "Detects unusually low load drops in traffic or resource usage"
  type        = object({
    enabled              = bool
    threshold_percentage = number
  })
  default = null
}

variable "crash_rate_increase" {
  description = "Detects increases in application crash rates"
  type        = object({
    enabled                     = bool
    detection_mode              = string
    crash_rate_increase_fixed = object({
      absolute_crash_rate = number
      concurrent_users    = number
    })
  })
  default = null
}

variable "database_scope" {
  description = "Scope tag for database anomaly detection"
  type        = string
  default     = ""
}

variable "database_connections" {
  description = "Detects anomalies in database connection behaviors"
  type        = object({
    enabled             = bool
    max_failed_connects = number
    time_period         = number
  })
  default = null
}

variable "failure_rate" {
  description = "Detects high failure rates in application or infrastructure behavior"
  type        = object({
    enabled         = bool
    detection_mode  = string
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
  description = "Detects sharp drops in load or traffic patterns"
  type        = object({
    enabled = bool
  })
  default = null
}

variable "load_spikes" {
  description = "Detects sharp spikes in load or traffic patterns"
  type        = object({
    enabled = bool
  })
  default = null
}

variable "response_time" {
  description = "Detects degradation in application or service response times"
  type        = object({
    enabled         = bool
    detection_mode  = string
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
  description = "Configuration for detecting frequent issue patterns in apps, transactions, and infrastructure"
  type        = object({
    detect_apps  = bool
    detect_txn   = bool
    detect_infra = bool
  })
  default = {
    detect_apps  = false
    detect_txn   = false
    detect_infra = false
  }
}
