variable "github_connection_name" {
  description = "The name of the GitHub connection."
  type        = string
}

variable "github_connection_token" {
  description = "Token for the selected authentication type."
  type        = string
  sensitive   = true
}

variable "gitlab_connection_name" {
  description = "A unique and clearly identifiable connection name to your GitLab instance."
  type        = string
}

variable "gitlab_connection_url" {
  description = "The GitLab URL instance you want to connect. For example, https://gitlab.com"
  type        = string
}

variable "gitlab_connection_token" {
  description = "The GitLab token to use for authentication. Please note that this token is not refreshed and can expire."
  type        = string
  sensitive   = true
}

variable "jenkins_connection_name" {
  description = "The name of the Jenkins connection."
  type        = string
}

variable "jenkins_connection_url" {
  description = "Base URL of your Jenkins instance (e.g. https://[YOUR_JENKINS_DOMAIN]/)."
  type        = string
}

variable "jenkins_connection_username" {
  description = "The name of your Jenkins user (e.g. jenkins)."
  type        = string
}

variable "jenkins_connection_password" {
  description = "The password of the user or API token obtained from the Jenkins UI (Dashboard > User > Configure > API Token)."
  type        = string
  sensitive   = true
}

variable "ms365_email_connection_name" {
  description = "A unique name for the Microsoft 365 email connection."
  type        = string
}

variable "ms365_email_connection_tenant_id" {
  description = "Directory (tenant) ID of your Azure Active Directory."
  type        = string
}

variable "ms365_email_connection_client_id" {
  description = "Application (client) ID of your app registered in Microsoft Azure App registrations."
  type        = string
}

variable "ms365_email_connection_client_secret" {
  description = "Client secret of your app registered in Microsoft Azure App registrations."
  type        = string
  sensitive   = true
}

variable "ms365_email_connection_from_address" {
  description = "The email address from which the messages will be sent."
  type        = string
}

variable "msentraid_connection_name" {
  description = "The name of the Microsoft Entra Identity Developer connection."
  type        = string
}

variable "msentraid_connection_directory_id" {
  description = "Directory (tenant) ID of Microsoft Entra Identity Developer."
  type        = string
}

variable "msentraid_connection_application_id" {
  description = "Application (client) ID of your app registered in Microsoft Azure App registrations."
  type        = string
}

variable "msentraid_connection_client_secret" {
  description = "Client secret of your app registered in Microsoft Azure App registrations."
  type        = string
  sensitive   = true
}

variable "msentraid_connection_description" {
  description = "Description of the Microsoft Entra Identity Developer connection."
  type        = string
  default     = ""
}

variable "msteams_connection_name" {
  description = "The name of the Microsoft Teams connection."
  type        = string
}

variable "msteams_connection_webhook" {
  description = "The Webhook URL that links to the channel."
  type        = string
  sensitive   = true
}

variable "msteams_connection_channel_name" {
  description = "Optional channel name for the Microsoft Teams connection."
  type        = string
  default     = ""
}

variable "msteams_connection_team_name" {
  description = "Optional team name for the Microsoft Teams connection."
  type        = string
  default     = ""
}

variable "pagerduty_connection_name" {
  description = "The name of the PagerDuty connection."
  type        = string
}

variable "pagerduty_connection_url" {
  description = "URL of the PagerDuty API endpoint."
  type        = string
}

variable "pagerduty_connection_token" {
  description = "Token for the PagerDuty API endpoint."
  type        = string
  sensitive   = true
}

variable "servicenow_connection_name" {
  description = "A unique and clearly identifiable connection name to your ServiceNow instance."
  type        = string
}

variable "servicenow_connection_url" {
  description = "URL of the ServiceNow instance."
  type        = string
}

variable "servicenow_connection_type" {
  description = "Type of the ServiceNow connection. Possible Values: basic."
  type        = string
}

variable "servicenow_connection_user" {
  description = "Username or Email address for the ServiceNow connection."
  type        = string
}

variable "servicenow_connection_password" {
  description = "Password of the ServiceNow user."
  type        = string
  sensitive   = true
}