variable "application_id" {
  description = "Logical application ID used across web app modules."
  type        = string
  default     = "web-frontend-africa"
}

variable "javascript_version" {
  description = "JavaScript version used for injection updates in the Dynatrace web application."
  type        = string
  default     = "1.300.0"
}
