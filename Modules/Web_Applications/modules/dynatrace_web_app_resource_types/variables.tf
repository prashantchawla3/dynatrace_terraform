

variable "web_resource_types" {
  description = "Web resource classification rules for detailed reporting."
  type = list(object({
    primary_resource_type   = string
    regular_expression      = string
    insert_after            = string
    secondary_resource_type = string
  }))
  default = []
}
