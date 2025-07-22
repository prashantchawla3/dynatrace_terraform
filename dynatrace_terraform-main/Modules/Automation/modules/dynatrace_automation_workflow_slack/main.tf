resource "dynatrace_automation_workflow_slack" "slack" {
  name  = var.slack.name
  token = var.slack.token
}