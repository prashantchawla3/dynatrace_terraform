resource "dynatrace_host_monitoring" "example" {
  count   = length(var.host_monitoring)
  enabled = var.host_monitoring[count.index].enabled
  host_id = var.host_monitoring[count.index].host_id
}
