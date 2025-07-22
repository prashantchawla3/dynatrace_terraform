resource "dynatrace_monitored_technologies_python" "this" {
  count   = contains(keys(var.technologies), "python") ? 1 : 0
  enabled = var.technologies["python"].enabled
  host_id = var.technologies["python"].host_id
}
