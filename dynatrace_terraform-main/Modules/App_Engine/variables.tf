variable "resource_count" {
  description = "Number of resources to create"
  type        = number
  default     = 1
}

variable "resource_names" {
  description = "List of resource names"
  type        = list(string)
  default     = ["resource1"]
}

variable "url" {
  description = "URL for the connections"
  type        = string
  default     = "https://example.com"
}

variable "token" {
  description = "API token for the connections"
  type        = string
  default     = "your-api-token"
}

variable "type" {
  description = "Type for the connections"
  type        = string
  default     = "default-type"
}

variable "description" {
  description = "Description for the default rules"
  type        = string
  default     = "Default rule description"
}

variable "category" {
  description = "Category for the default rules"
  type        = string
  default     = "default-category"
}

variable "environment_scope" {
  description = "Environment scope for the default rules"
  type        = bool
  default     = true
}

variable "priority" {
  description = "Priority for the default rules"
  type        = string
  default     = "HIGH"
}

variable "query" {
  description = "Query for the default rules"
  type        = string
  default     = "status:active"
}

variable "title" {
  description = "Title for the default rules"
  type        = string
  default     = "Default Rule Title"
}

variable "action_name" {
  description = "Name for the actions"
  type        = string
  default     = "default-action"
}

variable "mode" {
  description = "Mode for the actions"
  type        = string
  default     = "ENABLED"
}

variable "muted" {
  description = "Muted setting for the default rules"
  type        = bool
  default     = false
}

variable "boolean_value" {
  description = "Boolean value for the discovery feature flags"
  type        = bool
  default     = true
}

variable "show_monitoring_candidates" {
  description = "Show monitoring candidates setting"
  type        = bool
  default     = true
}

variable "show_standalone_hosts" {
  description = "Show standalone hosts setting"
  type        = bool
  default     = false
}

variable "interface_saturation_threshold" {
  description = "Interface saturation threshold"
  type        = number
  default     = 85
}
