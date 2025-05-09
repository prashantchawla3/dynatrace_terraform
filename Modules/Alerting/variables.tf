variable "name" {
  type = string
}

variable "rules" {
  type = list(object({
    severity_level   = string
    delay_in_minutes = number
    include_mode     = string
    tags             = optional(list(string))
  }))
}

variable "maintenance_windows" {
  type = map(object({
    name              = string
    maintenance_type  = string
    suppression       = string
    schedule_type     = string
    start_time        = string
    end_time          = string
    time_zone         = string
  }))
}
