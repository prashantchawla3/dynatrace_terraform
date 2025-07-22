variable "smtp_host_name" {
  description = "The hostname of the SMTP server"
  type        = string
  default     = "smtp.example.com"
}

variable "smtp_port" {
  description = "The port used to connect to the SMTP server"
  type        = number
  default     = 587
}

variable "smtp_user_name" {
  description = "The username for SMTP authentication"
  type        = string
  default     = "smtpuser"
}

variable "smtp_password" {
  description = "The password for SMTP authentication"
  type        = string
  default     = "smtppassword"
  sensitive   = true
}

variable "smtp_is_password_configured" {
  description = "Indicates whether the SMTP password is configured"
  type        = bool
  default     = true
}

variable "smtp_connection_security" {
  description = "The type of connection security used (e.g., NONE, SSL, STARTTLS)"
  type        = string
  default     = "STARTTLS"
}

variable "smtp_sender_email_address" {
  description = "The email address used as the sender in SMTP messages"
  type        = string
  default     = "noreply@example.com"
}

variable "smtp_allow_fallback_via_mission_control" {
  description = "Allow fallback SMTP delivery via Mission Control if local delivery fails"
  type        = bool
  default     = false
}

variable "smtp_use_smtp_server" {
  description = "Whether to use the configured SMTP server for email delivery"
  type        = bool
  default     = true
}
