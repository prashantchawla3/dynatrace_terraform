output "php_enabled" {
  description = "Indicates whether php monitoring is enabled"
  value       = var.technologies["php"].enabled
}

output "php_host_id" {
  description = "Host ID for php monitoring"
  value       = var.technologies["php"].host_id
}