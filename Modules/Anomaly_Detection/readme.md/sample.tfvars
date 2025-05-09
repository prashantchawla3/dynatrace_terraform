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
      samples           = 100
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
      samples           = 200
      violating_samples = 20
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
        sample_count_thresholds = {
          samples           = 5
          violating_samples = 3
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
          samples           = 5
          violating_samples = 3
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
