variable "issue_tracking_enabled" {
  description = "Enable or disable the issue tracking"
  type        = bool
  default     = true
}

variable "issue_tracking_issuelabel" {
  description = "Label to identify these issues"
  type        = string
  default     = "dynatrace-issue"
}

variable "issue_tracking_issuequery" {
  description = "Query for retrieving issues from the tracking system"
  type        = string
  default     = "project = SRE AND status != Done"
}

variable "issue_tracking_issuetheme" {
  description = "Theme/category of the issue"
  type        = string
  default     = "observability"
}

variable "issue_tracking_issuetrackersystem" {
  description = "Issue tracker system name (e.g. JIRA, GitHub)"
  type        = string
  default     = "JIRA"
}

variable "issue_tracking_token" {
  description = "Token for authenticating with the issue tracker system"
  type        = string
  sensitive   = true
  default     = "fake-token"
}

variable "issue_tracking_url" {
  description = "Base URL for the issue tracker system API"
  type        = string
  default     = "https://jira.company.com"
}

variable "issue_tracking_username" {
  description = "Username used to authenticate against the issue tracker system"
  type        = string
  default     = "sre_bot"
}

variable "issue_tracking_insert_after" {
  description = "ID of the resource instance that comes before this instance regarding order"
  type        = string
  default     = null
}

variable "issue_tracking_password" {
  description = "Password used with the issue tracker system (if applicable)"
  type        = string
  sensitive   = true
  default     = null
}
