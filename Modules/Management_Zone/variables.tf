variable "zone_name" {
  description = "The name of the management zone"
  type        = string
}

variable "zone_description" {
  description = "The description of the management zone"
  type        = string
  default     = ""
}

variable "zone_legacy_id" {
  description = "The legacy ID of the management zone"
  type        = string
  default     = ""
}

variable "entity_selector" {
  description = "The entity selector for the management zone rules"
  type        = string
  default     = ""
}

variable "dynatrace_api_url" {
  description = "Dynatrace API URL"
  type        = string
}

variable "dynatrace_api_token" {
  description = "Dynatrace API token"
  type        = string
  sensitive   = true
}