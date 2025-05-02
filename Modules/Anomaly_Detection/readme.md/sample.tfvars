# Sample Terraform variables for Dynatrace disk anomaly detection

disk_anomalies = [
  {
    name                     = "disk_anomaly_1"
    enabled                  = true
    detection_mode           = "custom"
    disk_low_inodes_detection = {
      enabled = true
      custom_thresholds = [
        { free_inodes_percentage = 10 }
      ]
    }
    disk_low_space_detection = {
      enabled = true
      custom_thresholds = [
        { free_disk_space_percentage = 15 }
      ]
    }
    alerts = [
      { severity_level = "ERROR", threshold = 80 }
    ]
    event_properties = [
      { key = "environment", value = "production" }
    ]
  },
  {
    name    = "disk_anomaly_2"
    enabled = false
    # No nested blocks (skipped optional fields)
  }
]

disk_anomaly_rules = [
  {
    name       = "disk_rule_1"
    enabled    = true
    condition = {
      property = "total_space"
      operator = "LT"
      value    = 20
    }
    event_properties = [
      { key = "severity", value = "critical" }
    ]
    alerts = [
      { severity_level = "WARN", threshold = 70 }
    ]
  }
]

disk_edge_detectors = [
  {
    name       = "disk_edge_detector_1"
    enabled    = true
    metric_name = "disk.io.time"
    threshold   = 50
    event_properties = [
      { key = "source", value = "edge" }
    ]
    alerts = [
      { severity_level = "INFO", threshold = 60 }
    ]
  }
]

disk_specific_anomalies = [
  {
    name      = "disk_specific_anomaly_1"
    enabled   = true
    disk_low_space_detection = {
      enabled = true
      custom_thresholds = [
        { free_disk_space_percentage = 5 }
      ]
    }
    disk_low_inodes_detection = {
      enabled = true
      custom_thresholds = [
        { free_inodes_percentage = 5 }
      ]
    }
    event_properties = [
      { key = "team", value = "devops" }
    ]
    alerts = [
      { severity_level = "ERROR", threshold = 90 }
    ]
  }
]
