# Variables for dynatrace_issue_tracking
variable "issue_tracking_enabled" {
  description = "Enable or disable the issue tracking"
  type        = bool
}

variable "issue_tracking_issuelabel" {
  description = "Label to identify these issues"
  type        = string
}

variable "issue_tracking_issuequery" {
  description = "Query for the issue tracking"
  type        = string
}

variable "issue_tracking_issuetheme" {
  description = "Theme of the issue"
  type        = string
}

variable "issue_tracking_issuetrackersystem" {
  description = "Issue tracker system"
  type        = string
}

variable "issue_tracking_token" {
  description = "Token for the issue tracker system"
  type        = string
  sensitive   = true
}

variable "issue_tracking_url" {
  description = "URL for the issue tracker system"
  type        = string
}

variable "issue_tracking_username" {
  description = "Username for the issue tracker system"
  type        = string
}

variable "issue_tracking_insert_after" {
  description = "ID of the resource instance that comes before this instance regarding order"
  type        = string
  default     = null
}

variable "issue_tracking_password" {
  description = "Password for the issue tracker system"
  type        = string
  sensitive   = true
  default     = null
}

# Variables for dynatrace_remote_environments
variable "remote_environment_name" {
  description = "Name of the remote environment"
  type        = string
}

variable "remote_environment_network_scope" {
  description = "Network scope of the remote environment"
  type        = string
}

variable "remote_environment_token" {
  description = "Token for the remote environment"
  type        = string
  sensitive   = true
}

variable "remote_environment_uri" {
  description = "URI of the remote environment"
  type        = string
}