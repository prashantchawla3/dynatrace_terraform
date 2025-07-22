variable "service_now_active" {
  description = "Whether the ServiceNow notification is active"
  type        = bool
  default     = true
}

variable "service_now_name" {
  description = "The name of the ServiceNow notification"
  type        = string
  default     = "ServiceNow Notification"
}

variable "service_now_instance" {
  description = "The ServiceNow instance URL or identifier"
  type        = string
  default     = "your-instance.service-now.com"
}

variable "service_now_username" {
  description = "Username for authenticating with ServiceNow"
  type        = string
  default     = "admin"
}

variable "service_now_password" {
  description = "Password for authenticating with ServiceNow"
  type        = string
  default     = "your-password"
  sensitive   = true
}

variable "service_now_message" {
  description = "The message template for the ServiceNow notification"
  type        = string
  default     = "Dynatrace alert triggered"
}

variable "service_now_incidents" {
  description = "Whether to create incidents in ServiceNow"
  type        = bool
  default     = true
}

variable "service_now_events" {
  description = "Whether to create events in ServiceNow"
  type        = bool
  default     = false
}
