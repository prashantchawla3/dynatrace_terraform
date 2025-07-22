resource "dynatrace_nettracer" "example" {
  count       = length(var.net_tracers)
  scope       = var.net_tracers[count.index].scope
  net_tracer  = var.net_tracers[count.index].net_tracer
}
