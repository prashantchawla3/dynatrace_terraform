output "webhook_notification_ids" {
  value = [for n in dynatrace_appsec_notification.webhook : n.id]
}