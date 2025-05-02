
variable "environment_url" {
  type        = string
  description = "Dynatrace environment URL"
}

variable "dynatrace_client_id" {
  type        = string
  description = "OAuth client ID for Dynatrace"
}

variable "dynatrace_client_secret" {
  type        = string
  description = "OAuth client secret for Dynatrace"
  sensitive   = true
}

variable "guardian_name" {
  type        = string
  description = "Name of the Site Reliability Guardian"
}

variable "guardian_description" {
  type        = string
  default     = ""
}

variable "guardian_tags" {
  type        = list(string)
  default     = []
}

variable "objectives" {
  type = list(object({
    name                = string
    description         = optional(string)
    objective_type      = string
    dql_query           = optional(string)
    reference_slo       = optional(string)
    comparison_operator = string
    target              = number
    warning             = number
  }))
}
