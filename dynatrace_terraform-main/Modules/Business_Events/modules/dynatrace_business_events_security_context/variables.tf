variable "security_query" {
  description = "Query used in the security context rule"
  type        = string
  default     = "user.role == 'admin'"
}

variable "security_value_source_field" {
  description = "Field used as the value source in the security context"
  type        = string
  default     = "role"
}

variable "security_value_source" {
  description = "Source type for the security context value"
  type        = string
  default     = "BODY"
}
