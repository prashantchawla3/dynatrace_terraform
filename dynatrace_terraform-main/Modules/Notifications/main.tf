
# ─── Core Alerting Rule ────────────────────────────────────
module "alerting_rule" {
  source        = "./modules/dynatrace_alerting"
  alerting_name = var.alerting_name
}

# ─── Ansible Tower Integration ─────────────────────────────
module "ansible_tower" {
  source = "./modules/dynatrace_ansible_tower_notification"

  ansible_tower_active             = var.ansible_tower_active
  ansible_tower_name               = var.ansible_tower_name
  ansible_tower_insecure           = var.ansible_tower_insecure
  ansible_tower_job_template_url   = var.ansible_tower_job_template_url
  ansible_tower_username           = var.ansible_tower_username
  ansible_tower_password           = var.ansible_tower_password
  ansible_tower_custom_message     = var.ansible_tower_custom_message
}

# ─── Email Notification ───────────────────────────────────
module "email" {
  source = "./modules/email"

  email_active                    = var.email_active
  email_name                      = var.email_name
  email_subject                   = var.email_subject
  email_to                        = var.email_to
  email_cc                        = var.email_cc
  email_bcc                       = var.email_bcc
  email_notify_closed_problems    = var.email_notify_closed_problems
  email_body                      = var.email_body
}

# ─── Jira Integration ──────────────────────────────────────
module "jira" {
  source = "./modules/dynatrace_jira_notification"

  jira_active        = var.jira_active
  jira_name          = var.jira_name
  jira_url           = var.jira_url
  jira_username      = var.jira_username
  jira_api_token     = var.jira_api_token
  jira_project_key   = var.jira_project_key
  jira_issue_type    = var.jira_issue_type
  jira_summary       = var.jira_summary
  jira_description   = var.jira_description
}

# ─── Slack Alerts ──────────────────────────────────────────
module "slack" {
  source = "./modules/dynatrace_slack_notification"

  slack_active  = var.slack_active
  slack_name    = var.slack_name
  slack_url     = var.slack_url
  slack_channel = var.slack_channel
  slack_message = var.slack_message
}

# ─── Trello Integration ────────────────────────────────────
module "trello" {
  source = "./modules/dynatrace_trello_notification"

  trello_active            = var.trello_active
  trello_name              = var.trello_name
  trello_application_key   = var.trello_application_key
  trello_board_id          = var.trello_board_id
  trello_list_id           = var.trello_list_id
  trello_resolved_list_id  = var.trello_resolved_list_id
  trello_text              = var.trello_text
  trello_description       = var.trello_description
  trello_authorization_token = var.trello_authorization_token
}
