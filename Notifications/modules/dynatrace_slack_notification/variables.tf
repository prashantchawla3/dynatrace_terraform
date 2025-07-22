variable "slack_active" {
  description = "Enable Slack alerts"
  type        = bool
  default     = false
}

variable "slack_name" {
  description = "Display name for Slack destination"
  type        = string
  default     = "SlackChannelAlerts"
}

variable "slack_url" {
  description = "Webhook URL for Slack messages"
  type        = string
  default     = ""
}

variable "slack_channel" {
  description = "Slack channel name or ID"
  type        = string
  default     = "#alerts"
}

variable "slack_message" {
  description = "Slack message text content"
  type        = string
  default     = "Dynatrace alert triggered."
}
