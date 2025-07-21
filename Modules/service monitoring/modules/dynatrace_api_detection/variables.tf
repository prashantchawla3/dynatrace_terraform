variable "api_color" {
  description = "Color label to visually identify the API in UI elements."
  type        = string
  default     = "#00A3E0"
}

variable "api_name" {
  description = "Logical name of the API being modeled."
  type        = string
  default     = "easytrade-api"
}

variable "third_party_api" {
  description = "Boolean flag indicating whether the API is externally owned."
  type        = bool
  default     = false
}