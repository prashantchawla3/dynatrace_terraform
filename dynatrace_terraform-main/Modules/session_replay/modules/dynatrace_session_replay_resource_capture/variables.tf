variable "application_id" {
  description = "Logical application or environment identifier used to scope session replay settings."
  type        = string
  default     = "environment"
}

variable "enable_resource_capturing" {
  description = "Toggle to enable collection of static and dynamic resources for replay visualization."
  type        = bool
  default     = true
}
variable "resource_capture_url_exclusion_pattern_list" {
  description = "List of URL patterns to exclude from resource capture (e.g., tracking pixels, external services)."
  type        = list(string)
  default     = ["www.google.com"]
}