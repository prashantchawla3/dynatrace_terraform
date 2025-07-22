variable "url_based_sampling_enabled" {
  description = "Flag to enable or disable the URL-based sampling rule."
  type        = bool
  default     = true
}

variable "url_based_sampling_factor" {
  description = "Sampling factor for the matching requests (e.g., 10 means 1 out of 10)."
  type        = number
  default     = 10
}

variable "url_based_sampling_http_method_any" {
  description = "If true, applies to all HTTP methods; otherwise, method must be specified."
  type        = bool
  default     = true
}

variable "url_based_sampling_ignore" {
  description = "If true, requests matching the pattern will be ignored in sampling."
  type        = bool
  default     = false
}

variable "url_based_sampling_path" {
  description = "The URL path pattern to match (e.g., /api/*)."
  type        = string
  default     = "/api/*"
}

variable "url_based_sampling_path_comparison_type" {
  description = "How the path is compared (e.g., BEGINS_WITH, CONTAINS, EQUALS)."
  type        = string
  default     = "BEGINS_WITH"
}

variable "query_parameter_name" {
  description = "The name of the query parameter to match."
  type        = string
  default     = "user_id"
}

variable "query_parameter_value" {
  description = "The value of the query parameter to match."
  type        = string
  default     = "12345"
}

variable "query_parameter_value_is_undefined" {
  description = "If true, matches when the query parameter is undefined."
  type        = bool
  default     = false
}
