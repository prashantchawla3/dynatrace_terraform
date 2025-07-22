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
