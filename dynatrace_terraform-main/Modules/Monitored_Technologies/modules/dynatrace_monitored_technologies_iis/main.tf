resource "dynatrace_monitored_technologies_iis" "this" {
  count   = contains(keys(var.technologies), "iis") ? 1 : 0
  enabled = var.technologies["iis"].enabled
  host_id = var.technologies["iis"].host_id
}
