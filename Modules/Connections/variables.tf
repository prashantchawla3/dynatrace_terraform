variable "dynatrace_api_url" {
  description = "Dynatrace environment URL."
  type        = string
}

variable "dynatrace_api_token" {
  description = "API token for Dynatrace (sensitive)."
  type        = string
  sensitive   = true
}

variable "jenkins_connections" {
  description = "List of Jenkins connection configs."
  type = list(object({
    name     = string
    url      = string
    username = string
    password = string  # API token or password (sensitive at callsite)
  }))
}

variable "github_connections" {
  description = "List of GitHub connection configs."
  type = list(object({
    name  = string
    type  = string  # e.g. "Pat"
    token = string  # Personal Access Token (sensitive)
  }))
}

variable "gitlab_connections" {
  description = "List of GitLab connection configs."
  type = list(object({
    name  = string
    url   = string
    token = string  # Access token (sensitive)
  }))
}

variable "ms365_email_connections" {
  description = "List of Microsoft 365 email connection configs."
  type = list(object({
    name          = string
    client_id     = string
    tenant_id     = string
    from_address  = string
    type          = string   # e.g. "client_secret"
    client_secret = string   # Client secret (sensitive)
  }))
}

variable "msentraid_connections" {
  description = "List of Microsoft Entra ID (formerly Azure AD) connection configs."
  type = list(object({
    name            = string
    application_id  = string
    directory_id    = string
    client_secret   = string  # Client secret (sensitive)
    description     = optional(string)
  }))
}

variable "msteams_connections" {
  description = "List of Microsoft Teams connection configs."
  type = list(object({
    name        = string
    webhook     = string
    team_name   = optional(string)
    channel_name = optional(string)
  }))
}

variable "pagerduty_connections" {
  description = "List of PagerDuty connection configs."
  type = list(object({
    name  = string
    token = string  # PagerDuty API token (sensitive)
    url   = string
  }))
}

variable "servicenow_connections" {
  description = "List of ServiceNow connection configs."
  type = list(object({
    name     = string
    url      = string
    type     = string   # e.g. "basic"
    user     = optional(string)
    password = optional(string)  # ServiceNow password (sensitive)
  }))
}
