variable "web_javascript_updates" {
  description = "JavaScript tag update configurations for active applications."
  type = list(object({
    application_id     = string
    javascript_version = string
  }))
  default = []
}
