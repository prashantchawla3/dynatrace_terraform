variable "web_app_resource_cleanups" {
  description = "Regex-based cleanup rules for web resource naming and grouping."
  type = list(object({
    name               = string
    regular_expression = string
    replace_with       = string
    insert_after       = string
  }))
  default = []
}
