variable "rule_title" {
  type        = string
  description = "Title of the scheduling rule"
  default     = "Monthly Rule"
}

variable "recurrence" {
  type = object({
    datestart     = string
    days_in_month = list(number)
    days_in_year  = list(number)
    frequency     = string
    interval      = number
    months        = list(number)
    weekdays      = list(string)
    weeks         = list(number)
    workdays      = string
  })
  description = "Recurrence configuration"
  default = {
    datestart     = "2025-01-01"
    days_in_month = [1, 15]
    days_in_year  = []
    frequency     = "monthly"
    interval      = 1
    months        = []
    weekdays      = ["Monday"]
    weeks         = []
    workdays      = "true"
  }
}