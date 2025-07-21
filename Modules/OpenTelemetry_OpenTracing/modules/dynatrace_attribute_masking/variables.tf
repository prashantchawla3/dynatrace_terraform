variable "attribute_masking" {
  description = "Map of attributes and masking strategies to obfuscate sensitive fields."
  type = map(object({
    enabled = bool
    key     = string
    masking = string
  }))
  default = {
    user_email = {
      enabled = true
      key     = "email"
      masking = "SHA256"
    }
  }
}
