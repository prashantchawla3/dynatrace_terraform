resource "dynatrace_monitored_technologies_wsmb" "this" {
  count   = contains(keys(var.technologies), "wsmb") ? 1 : 0
  enabled = var.technologies["wsmb"].enabled
  host_id = var.technologies["wsmb"].host_id
}