variable "team_name" {
  description = "Team name"
  type        = string
}

variable "team_description" {
  description = "Description of the team"
  type        = string
}

variable "team_identifier" {
  description = "The team identifier"
  type        = string
}

variable "team_external_id" {
  description = "External ID for automation purposes"
  type        = string
}

variable "responsibility_development" {
  description = "Responsible for development"
  type        = bool
}

variable "responsibility_infrastructure" {
  description = "Responsible for infrastructure"
  type        = bool
}

variable "responsibility_line_of_business" {
  description = "Responsible for line of business"
  type        = bool
}

variable "responsibility_operations" {
  description = "Responsible for operations"
  type        = bool
}

variable "responsibility_security" {
  description = "Responsible for security"
  type        = bool
}

variable "additional_info_key" {
  description = "Key for additional information"
  type        = string
}

variable "additional_info_value" {
  description = "Value for additional information"
  type        = string
}

variable "additional_info_url" {
  description = "URL for additional information"
  type        = string
}

variable "contact_integration_type" {
  description = "Integration type for contact details"
  type        = string
  default     = "JIRA"
}

variable "contact_jira_default_assignee" {
  description = "Default assignee for JIRA"
  type        = string
}

variable "contact_jira_project" {
  description = "Project for JIRA"
  type        = string
}

variable "contact_ms_teams" {
  description = "MS Teams contact"
  type        = string
}

variable "contact_slack_channel" {
  description = "Slack channel contact"
  type        = string
}

variable "contact_url" {
  description = "URL for contact details"
  type        = string
}

variable "link_type" {
  description = "Type of link"
  type        = string
}

variable "link_url" {
  description = "URL for the link"
  type        = string
}

variable "supplementary_identifier" {
  description = "Supplementary identifier"
  type        = string
}
