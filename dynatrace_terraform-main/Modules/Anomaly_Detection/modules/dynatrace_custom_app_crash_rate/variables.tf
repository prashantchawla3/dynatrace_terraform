variable "crash_rate_increase" {
  description = "Detects increases in application crash rates"
  type        = object({
    enabled                     = bool
    detection_mode              = string
    crash_rate_increase_fixed = object({
      absolute_crash_rate = number
      concurrent_users    = number
    })
  })
  default = null
}