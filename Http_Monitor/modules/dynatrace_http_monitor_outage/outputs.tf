output "outage_monitor_id" {
  value = var.enable_outage_monitoring ? dynatrace_http_monitor_outage.outage[0].id : null
}
