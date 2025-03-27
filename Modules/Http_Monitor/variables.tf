variable "httpMonitorName" {
  description = "The name of the HTTP monitor"
  type        = string
}

variable "httpMonitorFrequency" {
  description = "The frequency of the HTTP monitor"
  type        = number
}

variable "httpLocationId" {
  description = "The location ID for the HTTP monitor"
  type        = string
}

variable "httpMonitorUrl" {
  description = "The URL to be monitored"
  type        = string
}