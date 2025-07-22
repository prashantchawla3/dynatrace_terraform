output "go_enabled" {
  description = "Indicates whether go monitoring is enabled"
  value       = var.technologies["go"].enabled
}

output "go_host_id" {
  description = "Host ID for go monitoring"
  value       = var.technologies["go"].host_id
}