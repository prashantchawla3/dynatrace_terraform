resource "dynatrace_process_monitoring" "process_monitoring" {
  host_group_id   = var.process_monitoring_host_group_id
  auto_monitoring = var.process_monitoring_auto_monitoring
}