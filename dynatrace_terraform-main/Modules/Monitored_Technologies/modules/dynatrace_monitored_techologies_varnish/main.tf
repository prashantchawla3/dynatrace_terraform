resource "dynatrace_monitored_technologies_varnish" "this" {
  count   = contains(keys(var.technologies), "varnish") ? 1 : 0
  enabled = var.technologies["varnish"].enabled
  host_id = var.technologies["varnish"].host_id
}
