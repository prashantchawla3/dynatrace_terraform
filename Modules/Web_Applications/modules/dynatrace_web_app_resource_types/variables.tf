variable "primary_resource_type" {
  description = "Primary resource type used in web resource classification."
  type        = string
  default     = "javascript"
}

variable "regular_expression" {
  description = "Regex used for matching resource types or injection paths."
  type        = string
  default     = ".*\\.js$"
}

variable "secondary_resource_type" {
  description = "Optional secondary type for resource classification."
  type        = string
  default     = null
}

variable "insert_after" {
  description = "Ordering key used to insert configuration after a defined marker."
  type        = string
  default     = null
}
