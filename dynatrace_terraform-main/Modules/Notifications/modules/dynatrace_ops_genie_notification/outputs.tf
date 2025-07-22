output "ops_genie_notification_id" {
  description = "The ID of the created OpsGenie notification"
  value       = dynatrace_ops_genie_notification.ops_genie.id
}

output "ops_genie_notification_name" {
  description = "The name of the OpsGenie notification"
  value       = dynatrace_ops_genie_notification.ops_genie.name
}
