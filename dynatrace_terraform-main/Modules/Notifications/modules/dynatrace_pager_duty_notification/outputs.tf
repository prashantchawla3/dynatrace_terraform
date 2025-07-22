output "pager_duty_notification_id" {
  description = "The ID of the created PagerDuty notification"
  value       = dynatrace_pager_duty_notification.pager_duty.id
}

output "pager_duty_notification_name" {
  description = "The name of the PagerDuty notification"
  value       = dynatrace_pager_duty_notification.pager_duty.name
}
