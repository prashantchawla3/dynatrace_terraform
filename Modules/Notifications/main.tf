resource "dynatrace_alerting" "Default" {
  name = var.alerting_name
}

resource "dynatrace_ansible_tower_notification" "ansible_tower" {
  active           = var.ansible_tower_active
  name             = var.ansible_tower_name
  profile          = dynatrace_alerting.Default.id
  insecure         = var.ansible_tower_insecure
  job_template_url = var.ansible_tower_job_template_url
  username         = var.ansible_tower_username
  password         = var.ansible_tower_password
  custom_message   = var.ansible_tower_custom_message
}

resource "dynatrace_email_notification" "email" {
  active                 = var.email_active
  name                   = var.email_name
  profile                = dynatrace_alerting.Default.id
  subject                = var.email_subject
  to                     = var.email_to
  cc                     = var.email_cc
  bcc                    = var.email_bcc
  notify_closed_problems = var.email_notify_closed_problems
  body                   = var.email_body
}

resource "dynatrace_jira_notification" "jira" {
  active      = var.jira_active
  name        = var.jira_name
  profile     = dynatrace_alerting.Default.id
  url         = var.jira_url
  username    = var.jira_username
  api_token   = var.jira_api_token
  project_key = var.jira_project_key
  issue_type  = var.jira_issue_type
  summary     = var.jira_summary
  description = var.jira_description
}

resource "dynatrace_mobile_notifications" "mobile" {
  enabled = var.mobile_enabled
}

resource "dynatrace_ops_genie_notification" "ops_genie" {
  active  = var.ops_genie_active
  name    = var.ops_genie_name
  profile = dynatrace_alerting.Default.id
  domain  = var.ops_genie_domain
  message = var.ops_genie_message
  api_key = var.ops_genie_api_key
}

resource "dynatrace_pager_duty_notification" "pager_duty" {
  active  = var.pager_duty_active
  name    = var.pager_duty_name
  profile = dynatrace_alerting.Default.id
  account = var.pager_duty_account
  service = var.pager_duty_service
  api_key = var.pager_duty_api_key
}

resource "dynatrace_service_now_notification" "service_now" {
  active    = var.service_now_active
  name      = var.service_now_name
  profile   = dynatrace_alerting.Default.id
  instance  = var.service_now_instance
  username  = var.service_now_username
  password  = var.service_now_password
  message   = var.service_now_message
  incidents = var.service_now_incidents
  events    = var.service_now_events
}

resource "dynatrace_slack_notification" "slack" {
  active  = var.slack_active
  name    = var.slack_name
  profile = dynatrace_alerting.Default.id
  url     = var.slack_url
  channel = var.slack_channel
  message = var.slack_message
}

resource "dynatrace_trello_notification" "trello" {
  active              = var.trello_active
  name                = var.trello_name
  profile             = dynatrace_alerting.Default.id
  application_key     = var.trello_application_key
  board_id            = var.trello_board_id
  list_id             = var.trello_list_id
  resolved_list_id    = var.trello_resolved_list_id
  text                = var.trello_text
  description         = var.trello_description
  authorization_token = var.trello_authorization_token
}

resource "dynatrace_victor_ops_notification" "victor_ops" {
  active      = var.victor_ops_active
  name        = var.victor_ops_name
  profile     = dynatrace_alerting.Default.id
  api_key     = var.victor_ops_api_key
  routing_key = var.victor_ops_routing_key
  message     = var.victor_ops_message
}

resource "dynatrace_webhook_notification" "webhook" {
  active                 = var.webhook_active
  name                   = var.webhook_name
  profile                = dynatrace_alerting.Default.id
  url                    = var.webhook_url
  insecure               = var.webhook_insecure
  notify_event_merges    = var.webhook_notify_event_merges
  notify_closed_problems = var.webhook_notify_closed_problems
  payload                = var.webhook_payload
  headers {
    header {
      name  = var.webhook_header_name_01
      value = var.webhook_header_value_01
    }
    header {
      name         = var.webhook_header_name_02
      secret_value = var.webhook_header_value_02
    }
  }
  use_oauth_2 = var.webhook_use_oauth_2
  oauth_2_credentials {
    access_token_url = var.webhook_access_token_url
    client_id        = var.webhook_client_id
    client_secret    = var.webhook_client_secret
  }
}

resource "dynatrace_xmatters_notification" "xmatters" {
  active   = var.xmatters_active
  name     = var.xmatters_name
  profile  = dynatrace_alerting.Default.id
  url      = var.xmatters_url
  insecure = var.xmatters_insecure
  payload  = var.xmatters_payload
  headers {
    header {
      name  = var.xmatters_header_name_01
      value = var.xmatters_header_value_01
    }
    header {
      name         = var.xmatters_header_name_02
      secret_value = var.xmatters_header_value_02
    }
  }
}