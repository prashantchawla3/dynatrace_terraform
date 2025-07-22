variable "webhook_active" {
  description = "Whether the webhook notification is active"
  type        = bool
  default     = true
}

variable "webhook_name" {
  description = "The name of the webhook notification"
  type        = string
  default     = "Webhook Notification"
}

variable "webhook_url" {
  description = "The URL to which the webhook will send notifications"
  type        = string
  default     = "https://example.com/webhook"
}

variable "webhook_insecure" {
  description = "Whether to allow insecure SSL connections"
  type        = bool
  default     = false
}

variable "webhook_notify_event_merges" {
  description = "Whether to notify on event merges"
  type        = bool
  default     = true
}

variable "webhook_notify_closed_problems" {
  description = "Whether to notify when problems are closed"
  type        = bool
  default     = true
}

variable "webhook_payload" {
  description = "The payload to be sent in the webhook notification"
  type        = string
  default     = "{\"State\":\"{State}\",\"ProblemTitle\":\"{ProblemTitle}\"}"
}

variable "webhook_header_name_01" {
  description = "Name of the first custom header"
  type        = string
  default     = "X-Custom-Header-1"
}

variable "webhook_header_value_01" {
  description = "Value of the first custom header"
  type        = string
  default     = "HeaderValue1"
}

variable "webhook_header_name_02" {
  description = "Name of the second custom header"
  type        = string
  default     = "X-Custom-Header-2"
}

variable "webhook_header_value_02" {
  description = "Secret value of the second custom header"
  type        = string
  default     = "SecretHeaderValue2"
  sensitive   = true
}

variable "webhook_use_oauth_2" {
  description = "Whether to use OAuth 2.0 for authentication"
  type        = bool
  default     = false
}

variable "webhook_access_token_url" {
  description = "OAuth 2.0 access token URL"
  type        = string
  default     = "https://auth.example.com/oauth/token"
}

variable "webhook_client_id" {
  description = "OAuth 2.0 client ID"
  type        = string
  default     = "your-client-id"
}

variable "webhook_client_secret" {
  description = "OAuth 2.0 client secret"
  type        = string
  default     = "your-client-secret"
  sensitive   = true
}
