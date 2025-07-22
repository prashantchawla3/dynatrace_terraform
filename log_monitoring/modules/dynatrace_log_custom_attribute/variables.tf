variable "log_custom_attribute" {
  description = "Custom attributes added to log sidebar"
  type = map(object({
    sidebar = bool
    key     = string
  }))
  default = {}
}