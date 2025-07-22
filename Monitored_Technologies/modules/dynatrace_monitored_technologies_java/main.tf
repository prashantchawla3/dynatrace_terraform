resource "dynatrace_monitored_technologies_java" "this" {
  count   = contains(keys(var.technologies), "java") ? 1 : 0
  enabled = var.technologies["java"].enabled
  host_id = var.technologies["java"].host_id
}
