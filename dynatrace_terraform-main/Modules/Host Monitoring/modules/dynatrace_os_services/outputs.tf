output "os_service_ids" {
  description = "List of Dynatrace OS service resource IDs"
  value       = [for s in dynatrace_os_services.example : s.id]
}

output "os_service_names" {
  description = "List of OS service names created in Dynatrace"
  value       = [for s in dynatrace_os_services.example : s.name]
}

output "os_service_scopes" {
  description = "List of scopes applied to each OS service"
  value       = [for s in dynatrace_os_services.example : s.scope]
}
