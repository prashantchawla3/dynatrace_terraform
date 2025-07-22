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