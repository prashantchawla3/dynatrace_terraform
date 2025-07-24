output "host_monitoring_advanced_ids" {
  description = "List of IDs for each configured advanced host monitoring resource"
  value       = [for host in dynatrace_host_monitoring_advanced.example : host.id]
}

output "host_monitoring_advanced_host_ids" {
  description = "List of host IDs associated with advanced monitoring"
  value       = [for host in dynatrace_host_monitoring_advanced.example : host.host_id]
}

output "host_monitoring_agent_injection_status" {
  description = "List of process agent injection flags per host"
  value       = [for host in dynatrace_host_monitoring_advanced.example : host.process_agent_injection]
}

output "host_monitoring_code_module_status" {
  description = "List of code module injection flags per host"
  value       = [for host in dynatrace_host_monitoring_advanced.example : host.code_module_injection]
}
