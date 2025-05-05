variable "guardian_name" {
  type        = string
  description = "Name of the Site Reliability Guardian"
}

variable "guardian_description" {
  type        = string
  default     = ""
  description = "Description of the Site Reliability Guardian"
}

variable "guardian_tags" {
  type        = list(string)
  default     = []
  description = "Tags associated with the Site Reliability Guardian"
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
  description = "List of objectives for the Site Reliability Guardian"
}

variable "workflow_title" {
  description = "Title of the workflow"
  type        = string
}

variable "workflow_description" {
  description = "Description of the workflow"
  type        = string
  default     = ""
}

variable "workflow_actor" {
  description = "Actor ID for the workflow"
  type        = string
}

variable "workflow_owner" {
  description = "Owner ID for the workflow"
  type        = string
}

variable "workflow_tasks" {
  description = "List of tasks in the workflow"
  type = list(object({
    name        = string
    description = optional(string)
    action      = string
    active      = optional(bool)
    input       = string
    position = object({
      x = number
      y = number
    })
  }))
}

variable "workflow_trigger" {
  description = "Trigger configuration for the workflow"
  type = object({
    active     = bool
    event_type = string
    query      = string
  })
  default = null
}

