variable "xmatters_active" {
  description = "Whether the xMatters notification is active"
  type        = bool
  default     = true
}

variable "xmatters_name" {
  description = "The name of the xMatters notification"
  type        = string
  default     = "xMatters Notification"
}

variable "xmatters_url" {
  description = "The URL to which the xMatters notification will be sent"
  type        = string
  default     = "https://example.xmatters.com/api"
}

variable "xmatters_insecure" {
  description = "Whether to allow insecure SSL connections"
  type        = bool
  default     = false
}

variable "xmatters_payload" {
  description = "The payload to be sent in the xMatters notification"
  type        = string
  default     = "{\"State\":\"{State}\",\"ProblemTitle\":\"{ProblemTitle}\"}"
}

variable "xmatters_header_name_01" {
  description = "Name of the first custom header"
  type        = string
  default     = "X-Custom-Header-1"
}

variable "xmatters_header_value_01" {
  description = "Value of the first custom header"
  type        = string
  default     = "HeaderValue1"
}

variable "xmatters_header_name_02" {
  description = "Name of the second custom header"
  type        = string
  default     = "X-Custom-Header-2"
}

variable "xmatters_header_value_02" {
  description = "Secret value of the second custom header"
  type        = string
  default     = "SecretHeaderValue2"
  sensitive   = true
}
