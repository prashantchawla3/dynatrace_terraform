resource "dynatrace_monitored_technologies_opentracing" "this" {
  count   = contains(keys(var.technologies), "opentracing") ? 1 : 0
  enabled = var.technologies["opentracing"].enabled
  host_id = var.technologies["opentracing"].host_id
}
