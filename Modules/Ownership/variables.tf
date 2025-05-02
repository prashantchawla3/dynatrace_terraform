variable "dynatrace_api_url" {
  description = "Dynatrace API URL"
  type        = string
}

variable "dynatrace_api_token" {
  description = "Dynatrace API token"
  type        = string
  sensitive   = true
}

variable "team_name" { description = "Team name"; type = string }
variable "team_description" { description = "Description of the team"; type = string }
variable "team_identifier" { description = "The team identifier"; type = string }
variable "team_external_id" { description = "External ID for automation purposes"; type = string }

variable "responsibility_development" { type = bool }
variable "responsibility_infrastructure" { type = bool }
variable "responsibility_line_of_business" { type = bool }
variable "responsibility_operations" { type = bool }
variable "responsibility_security" { type = bool }

variable "additional_info_key" { type = string }
variable "additional_info_value" { type = string }
variable "additional_info_url" { type = string }

variable "contact_integration_type" { type = string }
variable "contact_jira_default_assignee" { type = string }
variable "contact_jira_project" { type = string }
variable "contact_ms_teams" { type = string }
variable "contact_slack_channel" { type = string }
variable "contact_url" { type = string }

variable "link_type" { type = string }
variable "link_url" { type = string }

variable "supplementary_identifier" { type = string }