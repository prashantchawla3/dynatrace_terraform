variable "calendar_name" {
  type        = string
  description = "Name of the business calendar"
  default     = "Standard Calendar"
}

variable "valid_from" {
  type        = string
  description = "Start date of the calendar"
  default     = "2025-01-01"
}

variable "valid_to" {
  type        = string
  description = "End date of the calendar"
  default     = "2025-12-31"
}

variable "week_days" {
  type        = list(number)
  description = "List of weekdays (1=Monday to 7=Sunday)"
  default     = [1, 2, 3, 4, 5]
}

variable "week_start" {
  type        = number
  description = "Start day of the week (1=Monday)"
  default     = 1
}

variable "holidays" {
  type = list(object({
    date  = string
    title = string
  }))
  description = "List of holidays"
  default     = [
    { date = "2025-12-25", title = "Christmas Day" },
    { date = "2025-01-01", title = "New Year's Day" }
  ]
}

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

variable "aws_connection" {
  type = object({
    name     = string
    type     = string
    role_arn = string
  })
  description = "AWS connection configuration"
  default = {
    name     = "aws-default"
    type     = "iam"
    role_arn = "arn:aws:iam::123456789012:role/example-role"
  }
}

variable "jira" {
  type = object({
    name     = string
    type     = string
    password = string
    url      = string
    user     = string
  })
  description = "Jira connection configuration"
  default = {
    name     = "jira-default"
    type     = "basic"
    password = "changeme"
    url      = "https://jira.example.com"
    user     = "admin"
  }
}

variable "k8s" {
  type = object({
    name      = string
    uid       = string
    namespace = string
    token     = string
  })
  description = "Kubernetes connection configuration"
  default = {
    name      = "k8s-default"
    uid       = "cluster-uid-123"
    namespace = "default"
    token     = "changeme"
  }
}

variable "slack" {
  type = object({
    name  = string
    token = string
  })
  description = "Slack connection configuration"
  default = {
    name  = "slack-default"
    token = "xoxb-your-token"
  }
}
