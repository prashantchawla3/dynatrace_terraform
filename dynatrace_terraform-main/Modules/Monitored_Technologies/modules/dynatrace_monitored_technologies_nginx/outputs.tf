output "nginx_enabled" {
  description = "Indicates whether nginx monitoring is enabled"
  value       = var.technologies["nginx"].enabled
}

output "nginx_host_id" {
  description = "Host ID for nginx monitoring"
  value       = var.technologies["nginx"].host_id
}