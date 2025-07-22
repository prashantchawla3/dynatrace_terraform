output "service_now_notification_id" {
  description = "The ID of the created ServiceNow notification"
  value       = dynatrace_service_now_notification.service_now.id
}

output "service_now_notification_name" {
  description = "The name of the ServiceNow notification"
  value       = dynatrace_service_now_notification.service_now.name
}
