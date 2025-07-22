module "grail_relationship" {
  source = "./modules/dynatrace_generic_relationships"

  generic_relationships_enabled              = var.generic_relationships_enabled
  generic_relationships_created_by           = var.generic_relationships_created_by
  generic_relationships_from_role            = var.generic_relationships_from_role
  generic_relationships_from_type            = var.generic_relationships_from_type
  generic_relationships_to_role              = var.generic_relationships_to_role
  generic_relationships_to_type              = var.generic_relationships_to_type
  generic_relationships_type_of_relation     = var.generic_relationships_type_of_relation
  generic_relationships_sources_condition    = var.generic_relationships_sources_condition
  generic_relationships_sources_source_type  = var.generic_relationships_sources_source_type
}

module "grail_entity_type" {
  source = "./modules/dynatrace_generic_types"

  generic_types_name                          = var.generic_types_name
  generic_types_enabled                       = var.generic_types_enabled
  generic_types_created_by                    = var.generic_types_created_by
  generic_types_display_name                  = var.generic_types_display_name
  generic_types_rules_icon_pattern            = var.generic_types_rules_icon_pattern
  generic_types_rules_id_pattern              = var.generic_types_rules_id_pattern
  generic_types_rules_instance_name_pattern   = var.generic_types_rules_instance_name_pattern
  generic_types_rules_attributes_key          = var.generic_types_rules_attributes_key
  generic_types_rules_attributes_pattern      = var.generic_types_rules_attributes_pattern
  generic_types_rules_required_dimensions_key = var.generic_types_rules_required_dimensions_key
  generic_types_rules_sources_condition       = var.generic_types_rules_sources_condition
  generic_types_rules_sources_source_type     = var.generic_types_rules_sources_source_type
}

module "grail_security_context" {
  source = "./modules/dynatrace_grail_security_context"

  grail_security_context_entity_type           = var.grail_security_context_entity_type
  grail_security_context_destination_property  = var.grail_security_context_destination_property
}
