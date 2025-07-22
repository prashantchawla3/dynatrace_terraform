variable "attribute_allow_list" {
  description = "Map of allowed attributes that are explicitly permitted for processing."
  type = map(object({
    enabled = bool
    key     = string
  }))
  default = {
    trace_id = {
      enabled = true
      key     = "trace_id"
    }
    customer_id = {
      enabled = false
      key     = "customer_id"
    }
  }
}