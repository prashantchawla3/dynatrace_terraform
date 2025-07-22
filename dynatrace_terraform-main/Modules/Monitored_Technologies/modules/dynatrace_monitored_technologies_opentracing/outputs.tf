output "opentracing_enabled" {
  description = "Indicates whether opentracing monitoring is enabled"
  value       = var.technologies["opentracing"].enabled
}

output "opentracing_host_id" {
  description = "Host ID for opentracing monitoring"
  value       = var.technologies["opentracing"].host_id
}