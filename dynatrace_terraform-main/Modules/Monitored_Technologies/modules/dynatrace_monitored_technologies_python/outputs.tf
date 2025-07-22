output "python_enabled" {
  description = "Indicates whether python monitoring is enabled"
  value       = var.technologies["python"].enabled
}

output "python_host_id" {
  description = "Host ID for python monitoring"
  value       = var.technologies["python"].host_id
}
