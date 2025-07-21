variable "team_name" {
  description = "Team name used for display in Dynatrace UI and documentation"
  type        = string
  default     = "Infrastructure Engineering"
}

variable "team_description" {
  description = "A short description summarizing the team's responsibilities or focus"
  type        = string
  default     = "Handles provisioning, cloud services, and performance monitoring"
}

variable "team_identifier" {
  description = "Unique team identifier used internally or across systems"
  type        = string
  default     = "infra-team-001"
}

variable "team_external_id" {
  description = "External identifier used for automation or integration hooks"
  type        = string
  default     = "ext-team-01"
}

variable "responsibility_development" {
  description = "Whether this team is responsible for development activities"
  type        = bool
  default     = false
}

variable "responsibility_infrastructure" {
  description = "Whether this team owns infrastructure setup and maintenance"
  type        = bool
  default     = true
}

variable "responsibility_line_of_business" {
  description = "Whether this team maps directly to a line of business"
  type        = bool
  default     = false
}

variable "responsibility_operations" {
  description = "Whether this team owns operational responsibilities (e.g., SRE, ops)"
  type        = bool
  default     = true
}

variable "responsibility_security" {
  description = "Whether this team owns application or platform security concerns"
  type        = bool
  default     = false
}

variable "additional_info_key" {
  description = "Custom metadata label used for tagging or annotation"
  type        = string
  default     = "pagerduty_schedule"
}

variable "additional_info_value" {
  description = "Value assigned to the metadata key"
  type        = string
  default     = "https://pagerduty.com/schedules/team01"
}

variable "additional_info_url" {
  description = "Optional reference or documentation URL for the metadata"
  type        = string
  default     = "https://wiki.company.com/infra-team"
}

variable "contact_integration_type" {
  description = "Preferred collaboration platform for incident routing or notifications"
  type        = string
  default     = "Slack"
}

variable "contact_jira_default_assignee" {
  description = "Default assignee in Jira when routing issues to this team"
  type        = string
  default     = "infra-automation"
}

variable "contact_jira_project" {
  description = "Jira project key used when creating issues for the team"
  type        = string
  default     = "INFRA"
}

variable "contact_ms_teams" {
  description = "Microsoft Teams channel ID used for escalation or notifications"
  type        = string
  default     = "infra-alerts"
}

variable "contact_slack_channel" {
  description = "Slack channel used for issue notifications or collaboration"
  type        = string
  default     = "#infra-notify"
}

variable "contact_url" {
  description = "External URL for escalation policies, team wiki, or contact info"
  type        = string
  default     = "https://support.company.com/team/infra"
}

variable "link_type" {
  description = "Type of supplemental link (e.g., dashboard, runbook, wiki)"
  type        = string
  default     = "runbook"
}

variable "link_url" {
  description = "URL pointing to the associated resource"
  type        = string
  default     = "https://wiki.company.com/runbooks/infra-recovery"
}

variable "supplementary_identifier" {
  description = "Optional handle or alias used to relate this team to external contexts"
  type        = string
  default     = "team-infra-recovery-01"
}
