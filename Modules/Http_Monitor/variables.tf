variable "http_monitor_name" {
  description = "The name of the HTTP monitor"
  type        = string
}

variable "http_monitor_enabled" {
  description = "Whether the monitor is enabled"
  type        = bool
  default     = true
}

variable "http_monitor_frequency" {
  description = "The frequency in minutes"
  type        = number
  default     = 5
}

variable "http_monitor_locations" {
  description = "List of locations to run the monitor from"
  type        = list(string)
}

variable "loading_time_thresholds_enabled" {
  description = "Enable loading time thresholds"
  type        = bool
  default     = false
}

variable "global_outage" {
  description = "Enable global outage detection"
  type        = bool
  default     = true
}

variable "local_outage" {
  description = "Enable local outage detection"
  type        = bool
  default     = false
}

variable "retry_on_error" {
  description = "Retry on error"
  type        = bool
  default     = false
}

variable "consecutive_runs" {
  description = "Number of consecutive failed runs before alerting"
  type        = number
  default     = 1
}

variable "http_monitor_description" {
  description = "Description of the HTTP monitor request"
  type        = string
}

variable "http_monitor_method" {
  description = "HTTP method to use for the request"
  type        = string
  default     = "GET"
}

variable "http_monitor_url" {
  description = "URL to monitor"
  type        = string
}

variable "accept_any_certificate" {
  description = "Accept any SSL certificate"
  type        = bool
  default     = true
}

variable "follow_redirects" {
  description = "Follow HTTP redirects"
  type        = bool
  default     = true
}

variable "validation_type" {
  description = "Validation rule type"
  type        = string
  default     = "httpStatusesList"
}

variable "validation_value" {
  description = "Value for validation rule"
  type        = string
  default     = ">=400"
}

variable "pass_if_found" {
  description = "Pass if validation value is found"
  type        = bool
  default     = false
}