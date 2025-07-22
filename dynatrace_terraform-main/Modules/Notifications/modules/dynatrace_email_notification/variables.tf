variable "email_active" {
  description = "Enable email notifications"
  type        = bool
  default     = false
}

variable "email_name" {
  description = "Display name for email destination"
  type        = string
  default     = "EmailAlerts"
}

variable "email_subject" {
  description = "Email subject line"
  type        = string
  default     = "Alert Notification"
}

variable "email_to" {
  description = "List of primary recipients"
  type        = list(string)
  default     = []
}

variable "email_cc" {
  description = "List of CC recipients"
  type        = list(string)
  default     = []
}

variable "email_bcc" {
  description = "List of BCC recipients"
  type        = list(string)
  default     = []
}

variable "email_notify_closed_problems" {
  description = "Send notification for closed problems"
  type        = bool
  default     = true
}

variable "email_body" {
  description = "Body of the email message"
  type        = string
  default     = "See Dynatrace problem details for more info."
}
