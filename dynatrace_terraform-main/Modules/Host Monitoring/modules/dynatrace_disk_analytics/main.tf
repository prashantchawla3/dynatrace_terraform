resource "dynatrace_disk_analytics" "example" {
  count   = length(var.disk_analytics)
  enabled = var.disk_analytics[count.index].enabled
  scope   = var.disk_analytics[count.index].scope
}
