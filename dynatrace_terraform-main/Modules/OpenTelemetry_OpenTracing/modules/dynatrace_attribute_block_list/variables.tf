variable "attribute_block_list" {
  description = "Map of blocked attributes that should be excluded from processing."
  type = map(object({
    enabled = bool
    key     = string
  }))
  default = {
    internal_session_token = {
      enabled = true
      key     = "internal_session_token"
    }
  }
}
