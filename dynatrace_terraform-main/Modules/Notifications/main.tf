
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
module "mobile_notification" {
  source = "./modules/dynatrace_mobile_notification"
  mobile_enabled           = var.mobile_enabled
}
module "ops_genie_notification" {
  source = "./modules/dynatrace_ops_genie_notification"
  ops_genie_active          = var.ops_genie_active
  ops_genie_name            = var.ops_genie_name
  ops_genie_domain          = var.ops_genie_domain
  ops_genie_message         = var.ops_genie_message
  ops_genie_api_key         = var.ops_genie_api_key
}
module "pager_duty_notification" {
  source = "./modules/dynatrace_ops_genie_notification"
  pager_duty_active          = var.pager_duty_active
  pager_duty_name            = var.pager_duty_name
  pager_duty_account         = var.pager_duty_account
  pager_duty_service         = var.pager_duty_service
  pager_duty_api_key         = var.pager_duty_api_key
}
module "service_now_notification" {
  source = "./modules/dynatrace_service_now_notification"
  service_now_active          = var.service_now_active
  service_now_events          = var.service_now_events
  service_now_incidents       = var.service_now_incidents
  service_now_instance        = var.service_now_instanc
  service_now_message         = var.service_now_messag
  service_now_name            = var.service_now_name
  service_now_username        = var.service_now_username
  service_now_password        = var.service_now_password
}
module "victor_ops_notification" {
  source = "./modules/dynatrace_victor_ops_notification"
  victor_ops_active              = var.victor_ops_active
  victor_ops_name                = var.victor_ops_name
  victor_ops_api_key             = var.victor_ops_api_key
  victor_ops_routing_key         = var.victor_ops_routing_key
  victor_ops_message             = var.victor_ops_message
}

module "notification_webhook" {
  source                          = "./modules/dynatrace_webhook_notification"
  webhook_active                  = var.webhook_active
  webhook_name                    = var.webhook_name
  webhook_url                     = var.webhook_url
  webhook_insecure                = var.webhook_insecure
  webhook_notify_event_merges     = var.webhook_notify_event_merges
  webhook_notify_closed_problems  = var.webhook_notify_closed_problems
  webhook_payload                 = var.webhook_payload
  webhook_header_name_01          = var.webhook_header_name_01
  webhook_header_value_01         = var.webhook_header_value_01
  webhook_header_name_02          = var.webhook_header_name_02
  webhook_header_value_02         = var.webhook_header_value_02
  webhook_use_oauth_2             = var.webhook_use_oauth_2
  webhook_access_token_url        = var.webhook_access_token_url
  webhook_client_id               = var.webhook_client_id
  webhook_client_secret           = var.webhook_client_secret
}

module "notification_xmatters" {
  source                    = "./modules/dynatrace_xmatters_notification"
  xmatters_active           = var.xmatters_active
  xmatters_name             = var.xmatters_name
  xmatters_url              = var.xmatters_url
  xmatters_insecure         = var.xmatters_insecure
  xmatters_payload          = var.xmatters_payload
  xmatters_header_name_01   = var.xmatters_header_name_01
  xmatters_header_value_01  = var.xmatters_header_value_01
  xmatters_header_name_02   = var.xmatters_header_name_02
  xmatters_header_value_02  = var.xmatters_header_value_02
}

