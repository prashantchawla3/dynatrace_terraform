output "ebpf_service_discovery_ids" {
  description = "List of IDs for each configured eBPF service discovery resource"
  value       = [for sd in dynatrace_ebpf_service_discovery.example : sd.id]
}

output "ebpf_service_discovery_scopes" {
  description = "List of scopes associated with each eBPF service discovery instance"
  value       = [for sd in dynatrace_ebpf_service_discovery.example : sd.scope]
}

output "ebpf_service_discovery_names" {
  description = "List of eBPF service names or tracers configured"
  value       = [for sd in dynatrace_ebpf_service_discovery.example : sd.ebpf]
}
