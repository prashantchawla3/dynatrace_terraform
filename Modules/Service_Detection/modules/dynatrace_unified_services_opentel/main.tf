resource "dynatrace_unified_services_opentel" "this" {
  count   = length(var.unified_services_opentel)
  enabled = var.unified_services_opentel[count.index].enabled
}
