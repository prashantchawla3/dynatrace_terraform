variable "log_debug_settings" {
  description = "Enable or disable global debug logging settings"
  type = map(object({
    enabled = bool
  }))
  default = {}
}
