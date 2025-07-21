resource "dynatrace_automation_workflow_jira" "jira" {
  name     = var.jira.name
  type     = var.jira.type
  password = var.jira.password
  url      = var.jira.url
  user     = var.jira.user
}