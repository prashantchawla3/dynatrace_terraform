variable "disk_analytics" {
  description = "Enable disk analytics on scoped hosts"
  type = list(object({
    enabled = bool
    scope   = string
  }))
  default = [
    { enabled = true, scope = "env:prod" }
  ]
}
