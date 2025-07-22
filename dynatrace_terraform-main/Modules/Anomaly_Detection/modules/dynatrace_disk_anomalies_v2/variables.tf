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