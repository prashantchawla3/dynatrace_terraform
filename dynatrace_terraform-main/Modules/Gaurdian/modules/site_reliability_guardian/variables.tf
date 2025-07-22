variable "guardian_name" {
  description = "Name of the Site Reliability Guardian"
  type        = string
  default     = "sre-guardian-main"
}

variable "guardian_description" {
  description = "Description of the Site Reliability Guardian"
  type        = string
  default     = "Protects services and orchestrates workflow responses based on SLOs and DQL evaluations"
}

variable "guardian_tags" {
  description = "Tags associated with the Site Reliability Guardian"
  type        = list(string)
  default     = ["sre", "automated-monitoring", "slos"]
}

variable "objectives" {
  description = "List of objectives for the Site Reliability Guardian"
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
  default = [
    {
      name                = "Error Rate"
      description         = "Ensures error rate stays below threshold"
      objective_type      = "DQL_QUERY"
      dql_query           = "fetch logs | filter status == 'error' | count()"
      reference_slo       = null
      comparison_operator = "LOWER"
      target              = 0.05
      warning             = 0.02
    }
  ]
}
