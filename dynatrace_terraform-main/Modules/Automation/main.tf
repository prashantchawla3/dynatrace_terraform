module "calendar" {
  source       = "./modules/dynatrace_automation_business_calendar"
  calendar_name = var.calendar_name
  valid_from    = var.valid_from
  valid_to      = var.valid_to
  week_days     = var.week_days
  week_start    = var.week_start
  holidays      = var.holidays
}

module "scheduler" {
  source      = "./modules/dynatrace_automation_scheduling_rule"
  rule_title  = var.rule_title
  recurrence  = var.recurrence
}

module "aws_connection" {
  source         = "./modules/dynatrace_automation_workflow_aws_connections"
  name           = var.aws_connection.name
  type           = var.aws_connection.type
  role_arn       = var.aws_connection.role_arn
}

module "jira_connection" {
  source   = "./modules/dynatrace_automation_workflow_jira"
  name     = var.jira.name
  type     = var.jira.type
  password = var.jira.password
  url      = var.jira.url
  user     = var.jira.user
}

module "k8s_connection" {
  source    = "./modules/dynatrace_automation_workflow_k8s_connections"
  name      = var.k8s.name
  uid       = var.k8s.uid
  namespace = var.k8s.namespace
  token     = var.k8s.token
}

module "slack_connection" {
  source = "./modules/dynatrace_automation_workflow_slack"
  name   = var.slack.name
  token  = var.slack.token
}
