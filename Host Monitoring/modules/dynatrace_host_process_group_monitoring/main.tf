resource "dynatrace_host_process_group_monitoring" "example" {
  count            = length(var.host_process_group_monitoring)
  host_id          = var.host_process_group_monitoring[count.index].host_id
  monitoring_state = var.host_process_group_monitoring[count.index].monitoring_state
  process_group    = var.host_process_group_monitoring[count.index].process_group
}
