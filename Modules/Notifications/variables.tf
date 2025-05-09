variable "alerting_name" {
  type = string
}

variable "ansible_tower_active" {
  type = bool
}

variable "ansible_tower_name" {
  type = string
}

variable "ansible_tower_insecure" {
  type = bool
}

variable "ansible_tower_job_template_url" {
  type = string
}

variable "ansible_tower_username" {
  type = string
}

variable "ansible_tower_password" {
  type = string
  sensitive = true
}

variable "ansible_tower_custom_message" {
  type = string
}

variable "email_active" {
  type = bool
}

variable "email_name" {
  type = string
}

variable "email_subject" {
  type = string
}

variable "email_to" {
  type = list(string)
}

variable "email_cc" {
  type = list(string)
}

variable "email_bcc" {
  type = list(string)
}

variable "email_notify_closed_problems" {
  type = bool
}

variable "email_body" {
  type = string
}

variable "jira_active" {
  type = bool
}

variable "jira_name" {
  type = string
}

variable "jira_url" {
  type = string
}

variable "jira_username" {
  type = string
}

variable "jira_api_token" {
  type = string
  sensitive = true
}

variable "jira_project_key" {
  type = string
}

variable "jira_issue_type" {
  type = string
}

variable "jira_summary" {
  type = string
}

variable "jira_description" {
  type = string
}

variable "mobile_enabled" {
  type = bool
}

variable "ops_genie_active" {
  type = bool
}

variable "ops_genie_name" {
  type = string
}

variable "ops_genie_domain" {
  type = string
}

variable "ops_genie_message" {
  type = string
}

variable "ops_genie_api_key" {
  type = string
  sensitive = true
}

variable "pager_duty_active" {
  type = bool
}

variable "pager_duty_name" {
  type = string
}

variable "pager_duty_account" {
  type = string
}

variable "pager_duty_service" {
  type = string
}

variable "pager_duty_api_key" {
  type = string
  sensitive = true
}

variable "service_now_active" {
  type = bool
}

variable "service_now_name" {
  type = string
}

variable "service_now_instance" {
  type = string
}

variable "service_now_username" {
  type = string
}

variable "service_now_password" {
  type = string
  sensitive = true
}

variable "service_now_message" {
  type = string
}

variable "service_now_incidents" {
  type = bool
}

variable "service_now_events" {
  type = bool
}

variable "slack_active" {
  type = bool
}

variable "slack_name" {
  type = string
}

variable "slack_url" {
  type = string
}

variable "slack_channel" {
  type = string
}

variable "slack_message" {
  type = string
}

variable "trello_active" {
  type = bool
}

variable "trello_name" {
  type = string
}

variable "trello_application_key" {
  type = string
  sensitive = true
}

variable "trello_board_id" {
  type = string
}

variable "trello_list_id" {
  type = string
}

variable "trello_resolved_list_id" {
  type = string
}

variable "trello_text" {
  type = string
}

variable "trello_description" {
  type = string
}

variable "trello_authorization_token" {
  type = string
  sensitive = true
}

variable "victor_ops_active" {
  type = bool
}

variable "victor_ops_name" {
  type = string
}

variable "victor_ops_api_key" {
  type = string
  sensitive = true
}

variable "victor_ops_routing_key" {
  type = string
}

variable "victor_ops_message" {
  type = string
}

variable "webhook_active" {
  type = bool
}

variable "webhook_name" {
  type = string
}

variable "webhook_url" {
  type = string
}

variable "webhook_insecure" {
  type = bool
}

variable "webhook_notify_event_merges" {
  type = bool
}

variable "webhook_notify_closed_problems" {
  type = bool
}

variable "webhook_payload" {
  type = string
}

variable "webhook_header_name_01" {
  type = string
}

variable "webhook_header_value_01" {
  type = string
}

variable "webhook_header_name_02" {
  type = string
}

variable "webhook_header_value_02" {
  type = string
  sensitive = true
}

variable "webhook_use_oauth_2" {
  type = bool
}

variable "webhook_access_token_url" {
  type = string
}

variable "webhook_client_id" {
  type = string
}

variable "webhook_client_secret" {
  type = string
  sensitive = true
}

variable "xmatters_active" {
  type = bool
}

variable "xmatters_name" {
  type = string
}

variable "xmatters_url" {
  type = string
}

variable "xmatters_insecure" {
  type = bool
}

variable "xmatters_payload" {
  type = string
}

variable "xmatters_header_name_01" {
  type = string
}

variable "xmatters_header_value_01" {
  type = string
}

variable "xmatters_header_name_02" {
  type = string
}

variable "xmatters_header_value_02" {
  type = string
  sensitive = true
}
