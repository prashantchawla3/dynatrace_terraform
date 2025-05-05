

variable "guardian_name" {
  type        = string
  description = "Name of the Site Reliability Guardian"
}

variable "guardian_description" {
  type    = string
  default = ""
}

variable "guardian_tags" {
  type    = list(string)
  default = []
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
