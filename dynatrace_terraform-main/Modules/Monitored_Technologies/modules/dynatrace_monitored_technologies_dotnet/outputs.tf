
output "dotnet_enabled" {
  description = "Indicates whether dotnet monitoring is enabled"
  value       = var.technologies["dotnet"].enabled
}

output "dotnet_host_id" {
  description = "Host ID for dotnet monitoring"
  value       = var.technologies["dotnet"].host_id
}
