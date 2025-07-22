variable "vulnerability_third_party" {
  description = "List of third-party vulnerability configurations"
  type = list(object({
    enabled  = bool
    mode     = string
    operator = string
    property = string
    value    = string
  }))
  default = []
}