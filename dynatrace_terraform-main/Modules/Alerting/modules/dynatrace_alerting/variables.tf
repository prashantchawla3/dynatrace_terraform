variable "alerting_name" {
  description = "Name of the Dynatrace alerting profile"
  type        = string
  default     = "default-alerting-profile"
}

variable "management_zone" {
  description = "Management zone for the alerting profile"
  type        = string
  default     = "Default Zone"
}

variable "rules" {
  description = "List of alerting rules"
  type = list(object({
    include_mode     = string
    tags             = list(string)
    delay_in_minutes = number
    severity_level   = string
  }))
  default = [
    {
      include_mode     = "INCLUDE_ALL"
      tags             = ["Environment:Production"]
      delay_in_minutes = 5
      severity_level   = "ERROR"
    }
  ]
}