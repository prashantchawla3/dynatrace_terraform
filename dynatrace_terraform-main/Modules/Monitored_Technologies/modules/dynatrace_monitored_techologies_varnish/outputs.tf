output "varnish_enabled" {
  description = "Indicates whether varnish monitoring is enabled"
  value       = var.technologies["varnish"].enabled
}

output "varnish_host_id" {
  description = "Host ID for varnish monitoring"
  value       = var.technologies["varnish"].host_id
}