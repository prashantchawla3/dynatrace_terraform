resource "dynatrace_generic_relationships" "example" {
  enabled          = var.generic_relationships_enabled
  created_by       = var.generic_relationships_created_by
  from_role        = var.generic_relationships_from_role
  from_type        = var.generic_relationships_from_type
  to_role          = var.generic_relationships_to_role
  to_type          = var.generic_relationships_to_type
  type_of_relation = var.generic_relationships_type_of_relation

  dynamic "sources" {
    for_each = [1]
    content {
      source {
        condition   = var.generic_relationships_sources_condition
        source_type = var.generic_relationships_sources_source_type
      }
    }
  }
}
