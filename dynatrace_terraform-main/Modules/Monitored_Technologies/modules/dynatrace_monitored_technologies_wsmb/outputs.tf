

output "wsmb_enabled" {
  description = "Indicates whether wsmb monitoring is enabled"
  value       = var.technologies["wsmb"].enabled
}
