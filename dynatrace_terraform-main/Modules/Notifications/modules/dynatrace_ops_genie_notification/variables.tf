variable "ops_genie_active" {
  description = "Whether the OpsGenie notification is active"
  type        = bool
  default     = true
}

variable "ops_genie_name" {
  description = "The name of the OpsGenie notification"
  type        = string
  default     = "OpsGenie Notification"
}

variable "ops_genie_domain" {
  description = "The domain for the OpsGenie integration"
  type        = string
  default     = "api.opsgenie.com"
}

variable "ops_genie_message" {
  description = "The message template for the OpsGenie notification"
  type        = string
  default     = "Dynatrace alert triggered"
}

variable "ops_genie_api_key" {
  description = "API key for authenticating with OpsGenie"
  type        = string
  default     = "your-opsgenie-api-key"
  sensitive   = true
}
