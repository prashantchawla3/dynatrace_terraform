variable "team_name" {
  description = "Team name"
  type        = string
}

variable "team_description" {
  description = "Description of the team"
  type        = string
  default     = "Created by Terraform"
}

variable "team_identifier" {
  description = "The team identifier"
  type        = string
}

variable "team_external_id" {
  description = "External ID for automation purposes"
  type        = string
  default     = ""
}

variable "responsibility_development" {
  description = "Responsible for development"
  type        = bool
  default     = true
}

variable "responsibility_infrastructure" {
  description = "Responsible for infrastructure"
  type        = bool
  default     = false
}

variable "responsibility_line_of_business" {
  description = "Responsible for line of business"
  type        = bool
  default     = false
}

variable "responsibility_operations" {
  description = "Responsible for operations"
  type        = bool
  default     = true
}

variable "responsibility_security" {
  description = "Responsible for security"
  type        = bool
  default     = false
}

variable "additional_info_key" {
  description = "Key for additional information"
  type        = string
  default     = "HashiCorp"
}

variable "additional_info_value" {
  description = "Value for additional information"
  type        = string
  default     = "Terraform"
}

variable "additional_info_url" {
  description = "URL for additional information"
  type        = string
  default     = "https://www.terraform.io/"
}

variable "contact_integration_type" {
  description = "Integration type for contact details"
  type        = string
  default     = "EMAIL"
}

variable "contact_email" {
  description = "Email for contact details"
  type        = string
  default     = "example@example.com"
}

variable "contact_ms_teams" {
  description = "MS Teams contact"
  type        = string
  default     = ""
}

variable "contact_slack_channel" {
  description = "Slack channel contact"
  type        = string
  default     = ""
}

variable "contact_url" {
  description = "URL for contact details"
  type        = string
  default     = ""
}

variable "contact_jira_default_assignee" {
  description = "Default assignee for JIRA"
  type        = string
  default     = ""
}

variable "contact_jira_project" {
  description = "Project for JIRA"
  type        = string
  default     = ""
}

variable "link_type" {
  description = "Type of link"
  type        = string
  default     = "URL"
}

variable "link_url" {
  description = "URL for the link"
  type        = string
  default     = "https://www.google.com"
}

variable "supplementary_identifier" {
  description = "Supplementary identifier"
  type        = string
  default     = "supplementary-id-example"
}