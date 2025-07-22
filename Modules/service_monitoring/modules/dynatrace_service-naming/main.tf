resource "dynatrace_service_naming" "example" {
  name    = var.service_naming_name
  enabled = var.service_naming_enabled
  format  = var.service_naming_format

  conditions {
    condition {
      key {
        type      = var.service_naming_key_type
        attribute = var.service_naming_key_attribute
      }
      service_type {
        negate   = var.service_naming_service_type_negate
        operator = var.service_naming_service_type_operator
        value    = var.service_naming_service_type_value
      }
    }
  }
}
