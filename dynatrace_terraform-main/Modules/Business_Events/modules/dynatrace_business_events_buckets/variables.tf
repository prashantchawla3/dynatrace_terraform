variable "buckets_enabled" {
  description = "Enable or disable the business events bucket"
  type        = bool
  default     = true
}

variable "bucket_name" {
  description = "Name of the business events bucket"
  type        = string
  default     = "business-events-bucket"
}

variable "buckets_matcher" {
  description = "Matcher expression for the business events bucket"
  type        = string
  default     = "contains(eventType)"
}
variable "rule_name" {
  description = "Common rule name used across multiple resources"
  type        = string
  default     = "BusinessEventsRule"
}
