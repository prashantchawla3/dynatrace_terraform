output "apache_enabled" {
  description = "Indicates whether apache monitoring is enabled"
  value       = var.technologies["apache"].enabled
}

output "apache_host_id" {
  description = "Host ID for apache monitoring"
}