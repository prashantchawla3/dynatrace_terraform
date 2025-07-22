output "java_enabled" {
  description = "Indicates whether java monitoring is enabled"
  value       = var.technologies["java"].enabled
}

output "java_host_id" {
  description = "Host ID for java monitoring"
  value       = var.technologies["java"].host_id
}