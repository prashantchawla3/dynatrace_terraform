resource "dynatrace_host_monitoring_mode" "example" {
  count           = length(var.host_monitoring_modes)
  host_id         = var.host_monitoring_modes[count.index].host_id
  monitoring_mode = var.host_monitoring_modes[count.index].monitoring_mode
}
