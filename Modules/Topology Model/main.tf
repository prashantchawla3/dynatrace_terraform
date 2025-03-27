resource "dynatrace_generic_relationships" "example" {
  enabled          = var.generic_relationships_enabled
  created_by       = var.generic_relationships_created_by
  from_role        = var.generic_relationships_from_role
  from_type        = var.generic_relationships_from_type
  to_role          = var.generic_relationships_to_role
  to_type          = var.generic_relationships_to_type
  type_of_relation = var.generic_relationships_type_of_relation
  sources {
    source {
      condition   = var.generic_relationships_sources_condition
      source_type = var.generic_relationships_sources_source_type
    }
  }
}

resource "dynatrace_generic_types" "example" {
  name         = var.generic_types_name
  enabled      = var.generic_types_enabled
  created_by   = var.generic_types_created_by
  display_name = var.generic_types_display_name
  rules {
    rule {
      icon_pattern          = var.generic_types_rules_icon_pattern
      id_pattern            = var.generic_types_rules_id_pattern
      instance_name_pattern = var.generic_types_rules_instance_name_pattern
      attributes {
        attribute {
          key     = var.generic_types_rules_attributes_key
          pattern = var.generic_types_rules_attributes_pattern
        }
      }
      required_dimensions {
        required_dimension {
          key = var.generic_types_rules_required_dimensions_key
        }
      }
      sources {
        source {
          condition   = var.generic_types_rules_sources_condition
          source_type = var.generic_types_rules_sources_source_type
        }
      }
    }
  }
}

resource "dynatrace_grail_security_context" "example" {
  entity_type         = var.grail_security_context_entity_type
  destination_property = var.grail_security_context_destination_property
}