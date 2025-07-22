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

variable "technology" {
  description = "Technology stack used by the service or API (e.g. JAVA, DOTNET)."
  type        = string
  default     = "JAVA"
}

variable "condition_base" {
  description = "Base condition used for request matching (e.g. path segment, header)."
  type        = string
  default     = "url-path"
}

variable "condition_matcher" {
  description = "Matching operation used in condition evaluation (e.g. EQUALS, CONTAINS)."
  type        = string
  default     = "BEGINS"
}

variable "condition_pattern" {
  description = "Pattern used to evaluate the base condition match."
  type        = string
  default     = "/api"
}
