variable "dynatrace_api_url" {
  description = "Dynatrace environment URL."
  type        = string
  default     = "https://dynatrace.example.com"
}

variable "dynatrace_api_token" {
  description = "API token for Dynatrace (sensitive)."
  type        = string
  sensitive   = true
  default     = "dt0c01.token.value.abcdef123456"
}

variable "jenkins_connections" {
  description = "List of Jenkins connection configs."
  type = list(object({
    name     = string
    url      = string
    username = string
    password = string
  }))
  default = [
    {
      name     = "jenkins-main"
      url      = "https://jenkins.example.com"
      username = "admin"
      password = "jenkins-api-token"
    }
  ]
}

variable "github_connections" {
  description = "List of GitHub connection configs."
  type = list(object({
    name  = string
    type  = string
    token = string
  }))
  default = [
    {
      name  = "github-main"
      type  = "Pat"
      token = "ghp_abcdef1234567890"
    }
  ]
}

variable "gitlab_connections" {
  description = "List of GitLab connection configs."
  type = list(object({
    name  = string
    url   = string
    token = string
  }))
  default = [
    {
      name  = "gitlab-main"
      url   = "https://gitlab.example.com"
      token = "glpat-abcdef123456"
    }
  ]
}

variable "ms365_email_connections" {
  description = "List of Microsoft 365 email connection configs."
  type = list(object({
    name          = string
    client_id     = string
    tenant_id     = string
    from_address  = string
    type          = string
    client_secret = string
  }))
  default = [
    {
      name          = "ms365-main"
      client_id     = "client-id-123"
      tenant_id     = "tenant-id-456"
      from_address  = "noreply@example.com"
      type          = "client_secret"
      client_secret = "ms365-secret"
    }
  ]
}

variable "msentraid_connections" {
  description = "List of Microsoft Entra ID (formerly Azure AD) connection configs."
  type = list(object({
    name            = string
    application_id  = string
    directory_id    = string
    client_secret   = string
    description     = optional(string)
  }))
  default = [
    {
      name            = "entra-main"
      application_id  = "app-id-789"
      directory_id    = "dir-id-012"
      client_secret   = "entra-secret"
      description     = "Azure AD app for SSO"
    }
  ]
}

variable "msteams_connections" {
  description = "List of Microsoft Teams connection configs."
  type = list(object({
    name         = string
    webhook      = string
    team_name    = optional(string)
    channel_name = optional(string)
  }))
  default = [
    {
      name         = "teams-monitoring"
      webhook      = "https://teams.example.com/webhook"
      team_name    = "DevOps"
      channel_name = "Alerts"
    }
  ]
}

variable "pagerduty_connections" {
  description = "List of PagerDuty connection configs."
  type = list(object({
    name  = string
    token = string
    url   = string
  }))
  default = [
    {
      name  = "pagerduty-main"
      token = "pd-token-xyz987"
      url   = "https://api.pagerduty.com"
    }
  ]
}

variable "servicenow_connections" {
  description = "List of ServiceNow connection configs."
  type = list(object({
    name     = string
    url      = string
    type     = string
    user     = optional(string)
    password = optional(string)
  }))
  default = [
    {
      name     = "servicenow-main"
      url      = "https://servicenow.example.com"
      type     = "basic"
      user     = "admin"
      password = "servicenow-password"
    }
  ]
}
