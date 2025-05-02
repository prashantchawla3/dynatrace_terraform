
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
    active = bool
    event_type = string
    query      = string
  })
  default = null
}
