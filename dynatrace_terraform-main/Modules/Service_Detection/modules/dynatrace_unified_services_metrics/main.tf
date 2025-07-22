resource "dynatrace_unified_services_metrics" "this" {
  count                 = length(var.unified_services_metrics)
  enable_endpoint_metrics = var.unified_services_metrics[count.index].enable_endpoint_metrics
  service_id              = var.unified_services_metrics[count.index].service_id
}