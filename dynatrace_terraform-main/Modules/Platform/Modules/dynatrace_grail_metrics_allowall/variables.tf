variable "grail_allowall" {
  description = "Allow all configuration."
  type = map(object({
    allow_all = bool
  }))
  default = {
    default = {
      allow_all = true
    }
  }
}
