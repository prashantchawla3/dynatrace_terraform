
variable "content_type_matcher" {
  description = "Matcher type for content type"
  type        = string
  default     = "EQUALS"
}

variable "content_type_value" {
  description = "Value to match for content type"
  type        = string
  default     = "application/json"
}