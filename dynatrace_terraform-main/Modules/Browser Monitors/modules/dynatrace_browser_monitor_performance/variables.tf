variable "performance_enabled" {
  description = "Enable or disable browser monitor performance tracking"
  type        = bool
  default     = false
}

variable "performance_event" {
  description = "The performance event to track (e.g., LOAD, FIRST_CONTENTFUL_PAINT)"
  type        = string
  default     = "LOAD"
}

variable "performance_threshold" {
  description = "Threshold value in milliseconds for the performance event"
  type        = number
  default     = 3000
}
