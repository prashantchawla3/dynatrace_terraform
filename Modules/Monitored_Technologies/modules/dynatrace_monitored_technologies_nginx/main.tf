resource "dynatrace_monitored_technologies_nginx" "this" {
  count   = contains(keys(var.technologies), "nginx") ? 1 : 0
  enabled = var.technologies["nginx"].enabled
  host_id = var.technologies["nginx"].host_id
}
