output "ansible_tower_notification_id" {
  value = dynatrace_ansible_tower_notification.ansible_tower.id
}

output "email_notification_id" {
  value = dynatrace_email_notification.email.id
}

output "jira_notification_id" {
  value = dynatrace_jira_notification.jira.id
}

output "mobile_notifications_id" {
  value = dynatrace_mobile_notifications.mobile.id
}

output "ops_genie_notification_id" {
  value = dynatrace_ops_genie_notification.ops_genie.id
}

output "pager_duty_notification_id" {
  value = dynatrace_pager_duty_notification.pager_duty.id
}

output "service_now_notification_id" {
  value = dynatrace_service_now_notification.service_now.id
}

output "slack_notification_id" {
  value = dynatrace_slack_notification.slack.id
}

output "trello_notification_id" {
  value = dynatrace_trello_notification.trello.id
}

output "victor_ops_notification_id" {
  value = dynatrace_victor_ops_notification.victor_ops.id
}

output "webhook_notification_id" {
  value = dynatrace_webhook_notification.webhook.id
}

output "xmatters_notification_id" {
  value = dynatrace_xmatters_notification.xmatters.id
}

output "alerting_profile_id" {
  value = dynatrace_alerting.Default.id
}
