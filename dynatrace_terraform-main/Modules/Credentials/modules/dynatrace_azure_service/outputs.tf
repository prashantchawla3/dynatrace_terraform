output "azure_service_ids" {
  description = "Map of Azure service names to their Dynatrace resource IDs"
  value = {
    for svc, res in dynatrace_azure_service.this :
    svc => res.id
  }
}

output "azure_service_names" {
  description = "List of Azure service names configured"
  value       = keys(dynatrace_azure_service.this)
}
