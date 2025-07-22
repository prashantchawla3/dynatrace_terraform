output "webhook_notification_id" {
  description = "The ID of the created webhook notification"
  value       = dynatrace_webhook_notification.webhook.id
}

output "webhook_notification_name" {
  description = "The name of the webhook notification"
  value       = dynatrace_webhook_notification.webhook.name
}
