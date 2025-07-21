resource "dynatrace_managed_backup" "this" {
  enabled                    = var.backup_enabled
  datacenter                = var.backup_datacenter
  include_rum_data          = var.backup_include_rum_data
  include_lm20_data         = var.backup_include_lm20_data
  include_ts_metric_data    = var.backup_include_ts_metric_data
  bandwidth_limit_mbits     = var.backup_bandwidth_limit_mbits
  max_es_snapshots_to_clean = var.backup_max_es_snapshots_to_clean
  cassandra_scheduled_time  = var.backup_cassandra_scheduled_time
  pause_backups             = var.backup_pause_backups
}
