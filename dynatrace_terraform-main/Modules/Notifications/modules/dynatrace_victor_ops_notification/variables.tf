variable "victor_ops_active" {
  description = "Whether the VictorOps notification is active"
  type        = bool
  default     = true
}

variable "victor_ops_name" {
  description = "The name of the VictorOps notification"
  type        = string
  default     = "VictorOps Notification"
}

variable "victor_ops_api_key" {
  description = "API key for authenticating with VictorOps"
  type        = string
  default     = "your-victorops-api-key"
  sensitive   = true
}

variable "victor_ops_routing_key" {
  description = "Routing key used by VictorOps to determine alert routing"
  type        = string
  default     = "default-routing-key"
}

variable "victor_ops_message" {
  description = "The message template for the VictorOps notification"
  type        = string
  default     = "Dynatrace alert triggered"
}
