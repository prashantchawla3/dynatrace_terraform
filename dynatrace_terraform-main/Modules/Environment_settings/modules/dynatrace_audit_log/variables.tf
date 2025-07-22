variable "audit_log_resources" {
  description = "Audit log settings and toggle per resource."
  type = list(object({
    name     = string
    type     = string
    settings = object({
      audit_log = object({
        enabled = bool
      })
    })
  }))
  default = []
}
