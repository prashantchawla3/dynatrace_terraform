resource "dynatrace_generic_types" "example" {
  name         = var.generic_types_name
  enabled      = var.generic_types_enabled
  created_by   = var.generic_types_created_by
  display_name = var.generic_types_display_name

  dynamic "rules" {
    for_each = [1]
    content {
      rule {
        icon_pattern          = var.generic_types_rules_icon_pattern
        id_pattern            = var.generic_types_rules_id_pattern
        instance_name_pattern = var.generic_types_rules_instance_name_pattern

        dynamic "attributes" {
          for_each = [1]
          content {
            attribute {
              key     = var.generic_types_rules_attributes_key
              pattern = var.generic_types_rules_attributes_pattern
            }
          }
        }

        dynamic "required_dimensions" {
          for_each = [1]
          content {
            required_dimension {
              key = var.generic_types_rules_required_dimensions_key
            }
          }
        }

        dynamic "sources" {
          for_each = [1]
          content {
            source {
              condition   = var.generic_types_rules_sources_condition
              source_type = var.generic_types_rules_sources_source_type
            }
          }
        }
      }
    }
  }
}
