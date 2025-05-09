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
}

variable "token" {
  description = "API token for the connections"
  type        = string
}

variable "type" {
  description = "Type for the connections"
  type        = string
}

variable "description" {
  description = "Description for the default rules"
  type        = string
}

variable "category" {
  description = "Category for the default rules"
  type        = string
}

variable "environment_scope" {
  description = "Environment scope for the default rules"
  type        = bool
}

variable "priority" {
  description = "Priority for the default rules"
  type        = string
}

variable "query" {
  description = "Query for the default rules"
  type        = string
}

variable "title" {
  description = "Title for the default rules"
  type        = string
}

variable "action_name" {
  description = "Name for the actions"
  type        = string
}

variable "mode" {
  description = "Mode for the actions"
  type        = string
}

variable "muted" {
  description = "Muted setting for the default rules"
  type        = bool
}

variable "boolean_value" {
  description = "Boolean value for the discovery feature flags"
  type        = bool
}

variable "show_monitoring_candidates" {
  description = "Show monitoring candidates setting"
  type        = bool
}

variable "show_standalone_hosts" {
  description = "Show standalone hosts setting"
  type        = bool
}

variable "interface_saturation_threshold" {
  description = "Interface saturation threshold"
  type        = number
}
