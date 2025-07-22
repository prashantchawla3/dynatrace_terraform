variable "ip_masking_resources" {
  description = "IP masking configuration for privacy compliance."
  type = list(object({
    name     = string
    type     = string
    settings = object({
      ip_address_masking = object({
        scope   = string
        enabled = bool
        type    = string
      })
    })
  }))
  default = []
}
