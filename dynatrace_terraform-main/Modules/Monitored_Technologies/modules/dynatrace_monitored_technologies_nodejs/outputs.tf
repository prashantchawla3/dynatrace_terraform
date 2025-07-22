
output "nodejs_enabled" {
  description = "Indicates whether nodejs monitoring is enabled"
  value       = var.technologies["nodejs"].enabled
}

output "nodejs_host_id" {
  description = "Host ID for nodejs monitoring"
  value       = var.technologies["nodejs"].host_id
}