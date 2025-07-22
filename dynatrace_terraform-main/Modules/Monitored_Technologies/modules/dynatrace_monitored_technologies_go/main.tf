resource "dynatrace_monitored_technologies_go" "this" {
  count   = contains(keys(var.technologies), "go") ? 1 : 0
  enabled = var.technologies["go"].enabled
  host_id = var.technologies["go"].host_id
}
