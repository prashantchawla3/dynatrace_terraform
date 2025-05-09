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
