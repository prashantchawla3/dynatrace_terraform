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

variable "workflow_title" {
  description = "Title of the workflow"
  type        = string
  default     = "Guardian Workflow"
}

variable "workflow_description" {
  description = "Description of the workflow"
  type        = string
  default     = "Triggered upon objective failures to restore system health"
}

variable "workflow_actor" {
  description = "Actor ID for the workflow"
  type        = string
  default     = "dynatrace"
}

variable "workflow_owner" {
  description = "Owner ID for the workflow"
  type        = string
  default     = "team-sre"
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
  default = [
    {
      name        = "Notify PagerDuty"
      description = "Trigger incident notification"
      action      = "pagerduty.createIncident"
      active      = true
      input       = "{\"summary\": \"Guardian alert triggered\", \"priority\": \"high\"}"
      position    = { x = 0, y = 0 }
    },
    {
      name        = "Restart Service"
      description = "Restart backend service"
      action      = "runbook.restartContainer"
      active      = true
      input       = "{\"service_id\": \"backend-api\"}"
      position    = { x = 1, y = 0 }
    }
  ]
}

variable "workflow_trigger" {
  description = "Trigger configuration for the workflow"
  type = object({
    active     = bool
    event_type = string
    query      = string
  })
  default = {
    active     = true
    event_type = "GUARDIAN_FAILED"
    query      = "fetch events | filter type == 'guardian-failure'"
  }
}
