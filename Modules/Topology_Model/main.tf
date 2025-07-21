
# ─── Generic Relationship Mapping ──────────────────────────
module "grail_relationship" {
  source = "./modules/dynatrace_generic_relationships"

  enabled               = var.generic_relationships_enabled
  created_by            = var.generic_relationships_created_by
  from_role             = var.generic_relationships_from_role
  from_type             = var.generic_relationships_from_type
  to_role               = var.generic_relationships_to_role
  to_type               = var.generic_relationships_to_type
  type_of_relation      = var.generic_relationships_type_of_relation
  sources_condition     = var.generic_relationships_sources_condition
  sources_source_type   = var.generic_relationships_sources_source_type
}

# ─── Generic Entity Type Definition ───────────────────────
module "grail_entity_type" {
  source = "./modules/dynatrace_generic_types"

  enabled                        = var.generic_types_enabled
  name                           = var.generic_types_name
  created_by                     = var.generic_types_created_by
  display_name                   = var.generic_types_display_name
  rules_icon_pattern             = var.generic_types_rules_icon_pattern
  rules_id_pattern               = var.generic_types_rules_id_pattern
  rules_instance_name_pattern    = var.generic_types_rules_instance_name_pattern
  rules_attributes_key           = var.generic_types_rules_attributes_key
  rules_attributes_pattern       = var.generic_types_rules_attributes_pattern
  rules_required_dimensions_key  = var.generic_types_rules_required_dimensions_key
  rules_sources_condition        = var.generic_types_rules_sources_condition
  rules_sources_source_type      = var.generic_types_rules_sources_source_type
}

# ─── Grail Security Context Scoping ───────────────────────
module "grail_security_context" {
  source = "./modules/dynatrace_grail_security_context"

  entity_type            = var.grail_security_context_entity_type
  destination_property   = var.grail_security_context_destination_property
}
