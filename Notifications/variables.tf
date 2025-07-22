variable "alerting_name" {
  description = "Name identifier for the alerting configuration block"
  type        = string
  default     = "core-alerting-rule"
}

# ── Ansible Tower ─────────────────────
variable "ansible_tower_active" {
  description = "Enable or disable Ansible Tower integration"
  type        = bool
  default     = false
}

variable "ansible_tower_name" {
  description = "Display name for Ansible Tower destination"
  type        = string
  default     = "AnsibleTower"
}

variable "ansible_tower_insecure" {
  description = "Allow insecure TLS connection for Ansible Tower"
  type        = bool
  default     = false
}

variable "ansible_tower_job_template_url" {
  description = "URL to Ansible Tower job template"
  type        = string
  default     = ""
}

variable "ansible_tower_username" {
  description = "Username for Ansible Tower authentication"
  type        = string
  default     = "admin"
}

variable "ansible_tower_password" {
  description = "Password for Ansible Tower"
  type        = string
  sensitive   = true
  default     = "changeme"
}

variable "ansible_tower_custom_message" {
  description = "Message payload for Ansible Tower execution"
  type        = string
  default     = "Triggered via Dynatrace alert"
}

# ── Email ─────────────────────────────
variable "email_active" {
  description = "Enable email notifications"
  type        = bool
  default     = false
}

variable "email_name" {
  description = "Display name for email destination"
  type        = string
  default     = "EmailAlerts"
}

variable "email_subject" {
  description = "Email subject line"
  type        = string
  default     = "Alert Notification"
}

variable "email_to" {
  description = "List of primary recipients"
  type        = list(string)
  default     = []
}

variable "email_cc" {
  description = "List of CC recipients"
  type        = list(string)
  default     = []
}

variable "email_bcc" {
  description = "List of BCC recipients"
  type        = list(string)
  default     = []
}

variable "email_notify_closed_problems" {
  description = "Send notification for closed problems"
  type        = bool
  default     = true
}

variable "email_body" {
  description = "Body of the email message"
  type        = string
  default     = "See Dynatrace problem details for more info."
}

# ── Jira ──────────────────────────────
variable "jira_active" {
  description = "Enable Jira integration"
  type        = bool
  default     = false
}

variable "jira_name" {
  description = "Display name for Jira destination"
  type        = string
  default     = "JiraAlerts"
}

variable "jira_url" {
  description = "Base URL of Jira instance"
  type        = string
  default     = ""
}

variable "jira_username" {
  description = "Username for Jira authentication"
  type        = string
  default     = "jira_bot"
}

variable "jira_api_token" {
  description = "API token for Jira"
  type        = string
  sensitive   = true
  default     = ""
}

variable "jira_project_key" {
  description = "Jira project key"
  type        = string
  default     = "SRE"
}

variable "jira_issue_type" {
  description = "Type of issue created in Jira"
  type        = string
  default     = "Bug"
}

variable "jira_summary" {
  description = "Summary field for created Jira issues"
  type        = string
  default     = "New Dynatrace problem detected"
}

variable "jira_description" {
  description = "Description field for created Jira issues"
  type        = string
  default     = "Problem details attached from Dynatrace"
}

# ── Slack ─────────────────────────────
variable "slack_active" {
  description = "Enable Slack alerts"
  type        = bool
  default     = false
}

variable "slack_name" {
  description = "Display name for Slack destination"
  type        = string
  default     = "SlackChannelAlerts"
}

variable "slack_url" {
  description = "Webhook URL for Slack messages"
  type        = string
  default     = ""
}

variable "slack_channel" {
  description = "Slack channel name or ID"
  type        = string
  default     = "#alerts"
}

variable "slack_message" {
  description = "Slack message text content"
  type        = string
  default     = "Dynatrace alert triggered."
}

# ── Trello ────────────────────────────
variable "trello_active" {
  description = "Enable Trello integration"
  type        = bool
  default     = false
}

variable "trello_name" {
  description = "Display name for Trello integration"
  type        = string
  default     = "TrelloAlerts"
}

variable "trello_application_key" {
  description = "Trello application key"
  type        = string
  sensitive   = true
  default     = ""
}

variable "trello_board_id" {
  description = "Trello board ID where card is created"
  type        = string
  default     = ""
}

variable "trello_list_id" {
  description = "Trello list ID for open alerts"
  type        = string
  default     = ""
}

variable "trello_resolved_list_id" {
  description = "Trello list ID for resolved alerts"
  type        = string
  default     = ""
}

variable "trello_text" {
  description = "Trello card title"
  type        = string
  default     = "Alert card"
}

variable "trello_description" {
  description = "Trello card description"
  type        = string
  default     = "Details from Dynatrace alert"
}

variable "trello_authorization_token" {
  description = "Authorization token for Trello API"
  type        = string
  sensitive   = true
  default     = ""
}
