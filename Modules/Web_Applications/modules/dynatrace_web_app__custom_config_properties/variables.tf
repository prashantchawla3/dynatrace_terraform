variable "custom_config_properties" {
  description = "List of custom configuration properties scoped by application ID for enrichment or control."
  type = list(object({
    application_id  = string
    custom_property = string
  }))
  default = []
}
