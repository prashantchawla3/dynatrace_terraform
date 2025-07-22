output "xmatters_notification_id" {
  description = "The ID of the created xMatters notification"
  value       = dynatrace_xmatters_notification.xmatters.id
}

output "xmatters_notification_name" {
  description = "The name of the xMatters notification"
  value       = dynatrace_xmatters_notification.xmatters.name
}
