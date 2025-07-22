resource "dynatrace_slack_notification" "slack" {
  active  = var.slack_active
  name    = var.slack_name
  profile = dynatrace_alerting.Default.id
  url     = var.slack_url
  channel = var.slack_channel
  message = var.slack_message
}
