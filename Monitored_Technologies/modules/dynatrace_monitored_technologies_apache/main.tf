resource "dynatrace_monitored_technologies_apache" "this" {
  count   = contains(keys(var.technologies), "apache") ? 1 : 0
  enabled = var.technologies["apache"].enabled
  host_id = var.technologies["apache"].host_id
}
