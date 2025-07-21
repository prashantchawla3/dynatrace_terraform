variable "security_contexts" {
  description = "Security contexts with enablement flags."
  type = map(object({
    enabled = bool
  }))
  default = {
    context1 = {
      enabled = true
    }

  }
}