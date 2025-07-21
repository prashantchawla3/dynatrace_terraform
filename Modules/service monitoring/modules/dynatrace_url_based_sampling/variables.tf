variable "url_based_sampling_enabled" {
  description = "Enables traffic sampling based on URL path patterns."
  type        = bool
  default     = true
}

variable "url_based_sampling_factor" {
  description = "Sampling rate factor (e.g. 5 means 1 out of every 5 requests is retained)."
  type        = number
  default     = 5
}

variable "url_based_sampling_http_method_any" {
  description = "If true, sampling applies to all HTTP methods regardless of value."
  type        = bool
  default     = true
}

variable "url_based_sampling_ignore" {
  description = "If true, ignores the sampling configuration for matching URLs."
  type        = bool
  default     = false
}

variable "url_based_sampling_path" {
  description = "URL path pattern used for sampling filter."
  type        = string
  default     = "/api/"
}

variable "url_based_sampling_path_comparison_type" {
  description = "Comparison logic for path evaluation (e.g. BEGINS, CONTAINS)."
  type        = string
  default     = "BEGINS"
}