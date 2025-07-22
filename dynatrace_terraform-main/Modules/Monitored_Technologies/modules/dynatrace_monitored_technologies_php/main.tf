resource "dynatrace_monitored_technologies_php" "this" {
  count   = contains(keys(var.technologies), "php") ? 1 : 0
  enabled = var.technologies["php"].enabled
  host_id = var.technologies["php"].host_id
}
