resource "dynatrace_monitored_technologies_nodejs" "this" {
  count   = contains(keys(var.technologies), "nodejs") ? 1 : 0
  enabled = var.technologies["nodejs"].enabled
  host_id = var.technologies["nodejs"].host_id
}
