variable "pager_duty_active" {
  description = "Whether the PagerDuty notification is active"
  type        = bool
  default     = true
}

variable "pager_duty_name" {
  description = "The name of the PagerDuty notification"
  type        = string
  default     = "PagerDuty Notification"
}

variable "pager_duty_account" {
  description = "The PagerDuty account identifier"
  type        = string
  default     = "default-account"
}

variable "pager_duty_service" {
  description = "The PagerDuty service identifier"
  type        = string
  default     = "default-service"
}

variable "pager_duty_api_key" {
  description = "API key for authenticating with PagerDuty"
  type        = string
  default     = "your-pagerduty-api-key"
  sensitive   = true
}
