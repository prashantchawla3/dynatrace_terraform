variable "problem_fields" {
  description = "Problem field mapping rules."
  type = map(object({
    enabled       = bool
    event_field   = string
    problem_field = string
  }))
  default = {
    example = {
      enabled       = false
      event_field   = "example_event"
      problem_field = "example_problem"
    }
  }
}
