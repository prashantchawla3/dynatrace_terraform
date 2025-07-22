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