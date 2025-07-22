output "victor_ops_notification_id" {
  description = "The ID of the created VictorOps notification"
  value       = dynatrace_victor_ops_notification.victor_ops.id
}

output "victor_ops_notification_name" {
  description = "The name of the VictorOps notification"
  value       = dynatrace_victor_ops_notification.victor_ops.name
}
