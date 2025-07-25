variable "resource_count" {
  description = "Number of discovery feature flag resources to create"
  type        = number
  default     = 1
}

variable "resource_names" {
  description = "List of names for each discovery feature flag (indexed by count)"
  type        = list(string)
  default     = ["enable_auto_discovery"]
}

variable "type" {
  description = "Type of discovery feature flag (e.g., HOST_DISCOVERY, PROCESS_GROUP_DISCOVERY)"
  type        = string
  default     = "HOST_DISCOVERY"
}

variable "boolean_value" {
  description = "Boolean value indicating whether the feature is enabled (true) or disabled (false)"
  type        = bool
  default     = true
}
