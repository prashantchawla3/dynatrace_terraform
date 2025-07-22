output "configured_technologies" {
  value = keys(var.technologies)
}
output "apache_enabled" {
  description = "Indicates whether apache monitoring is enabled"
  value       = var.technologies["apache"].enabled
}

output "apache_host_id" {
  description = "Host ID for apache monitoring"
  value       = var.technologies["apache"].host_id
}

output "dotnet_enabled" {
  description = "Indicates whether dotnet monitoring is enabled"
  value       = var.technologies["dotnet"].enabled
}

output "dotnet_host_id" {
  description = "Host ID for dotnet monitoring"
  value       = var.technologies["dotnet"].host_id
}

output "go_enabled" {
  description = "Indicates whether go monitoring is enabled"
  value       = var.technologies["go"].enabled
}

output "go_host_id" {
  description = "Host ID for go monitoring"
  value       = var.technologies["go"].host_id
}

output "iis_enabled" {
  description = "Indicates whether iis monitoring is enabled"
  value       = var.technologies["iis"].enabled
}

output "iis_host_id" {
  description = "Host ID for iis monitoring"
  value       = var.technologies["iis"].host_id
}

output "java_enabled" {
  description = "Indicates whether java monitoring is enabled"
  value       = var.technologies["java"].enabled
}

output "java_host_id" {
  description = "Host ID for java monitoring"
  value       = var.technologies["java"].host_id
}

output "nginx_enabled" {
  description = "Indicates whether nginx monitoring is enabled"
  value       = var.technologies["nginx"].enabled
}

output "nginx_host_id" {
  description = "Host ID for nginx monitoring"
  value       = var.technologies["nginx"].host_id
}

output "nodejs_enabled" {
  description = "Indicates whether nodejs monitoring is enabled"
  value       = var.technologies["nodejs"].enabled
}

output "nodejs_host_id" {
  description = "Host ID for nodejs monitoring"
  value       = var.technologies["nodejs"].host_id
}

output "opentracing_enabled" {
  description = "Indicates whether opentracing monitoring is enabled"
  value       = var.technologies["opentracing"].enabled
}

output "opentracing_host_id" {
  description = "Host ID for opentracing monitoring"
  value       = var.technologies["opentracing"].host_id
}

output "php_enabled" {
  description = "Indicates whether php monitoring is enabled"
  value       = var.technologies["php"].enabled
}

output "php_host_id" {
  description = "Host ID for php monitoring"
  value       = var.technologies["php"].host_id
}

output "python_enabled" {
  description = "Indicates whether python monitoring is enabled"
  value       = var.technologies["python"].enabled
}

output "python_host_id" {
  description = "Host ID for python monitoring"
  value       = var.technologies["python"].host_id
}

output "wsmb_enabled" {
  description = "Indicates whether wsmb monitoring is enabled"
  value       = var.technologies["wsmb"].enabled
}

output "wsmb_host_id" {
  description = "Host ID for wsmb monitoring"
  value       = var.technologies["wsmb"].host_id
}

output "varnish_enabled" {
  description = "Indicates whether varnish monitoring is enabled"
  value       = var.technologies["varnish"].enabled
}

output "varnish_host_id" {
  description = "Host ID for varnish monitoring"
  value       = var.technologies["varnish"].host_id
}
