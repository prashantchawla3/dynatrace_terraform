output "slack_notification_id" {
  description = "The ID of the Slack notification configuration"
  value       = dynatrace_slack_notification.slack.id
}

output "slack_notification_name" {
  description = "The name of the Slack notification"
  value       = dynatrace_slack_notification.slack.name
}

output "slack_notification_active" {
  description = "Whether the Slack notification is active"
  value       = dynatrace_slack_notification.slack.active
}

output "slack_notification_channel" {
  description = "The Slack channel used for notifications"
  value       = dynatrace_slack_notification.slack.channel
}

output "slack_notification_message" {
  description = "The message template used in the Slack notification"
  value       = dynatrace_slack_notification.slack.message
}
