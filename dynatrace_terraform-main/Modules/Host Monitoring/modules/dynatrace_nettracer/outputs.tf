output "nettracer_ids" {
  description = "List of IDs for each configured Dynatrace NetTracer resource"
  value       = [for nt in dynatrace_nettracer.example : nt.id]
}

output "nettracer_scopes" {
  description = "List of scopes associated with each NetTracer"
  value       = [for nt in dynatrace_nettracer.example : nt.scope]
}

output "nettracer_names" {
  description = "List of net_tracer names applied in each configuration"
  value       = [for nt in dynatrace_nettracer.example : nt.net_tracer]
}
