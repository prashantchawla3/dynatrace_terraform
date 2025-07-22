variable "backup_enabled" {
  description = "Whether backups are enabled for the Dynatrace Managed cluster"
  type        = bool
  default     = true
}

variable "backup_datacenter" {
  description = "The datacenter where backups will be stored"
  type        = string
  default     = "dc1"
}

variable "backup_include_rum_data" {
  description = "Whether to include Real User Monitoring (RUM) data in the backup"
  type        = bool
  default     = false
}

variable "backup_include_lm20_data" {
  description = "Whether to include Log Monitoring v2.0 data in the backup"
  type        = bool
  default     = false
}

variable "backup_include_ts_metric_data" {
  description = "Whether to include time series metric data in the backup"
  type        = bool
  default     = true
}

variable "backup_bandwidth_limit_mbits" {
  description = "Maximum bandwidth in Mbit/s allowed for backup transfers"
  type        = number
  default     = 100
}

variable "backup_max_es_snapshots_to_clean" {
  description = "Maximum number of Elasticsearch snapshots to clean up"
  type        = number
  default     = 5
}

variable "backup_cassandra_scheduled_time" {
  description = "Scheduled time for Cassandra backups in HH:mm format"
  type        = string
  default     = "02:00"
}

variable "backup_pause_backups" {
  description = "Whether to pause all scheduled backups"
  type        = bool
  default     = false
}
