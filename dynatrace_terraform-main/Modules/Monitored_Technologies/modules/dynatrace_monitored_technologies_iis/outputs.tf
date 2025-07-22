output "iis_enabled" {
  description = "Indicates whether iis monitoring is enabled"
  value       = var.technologies["iis"].enabled
}

output "iis_host_id" {
  description = "Host ID for iis monitoring"
  value       = var.technologies["iis"].host_id
}