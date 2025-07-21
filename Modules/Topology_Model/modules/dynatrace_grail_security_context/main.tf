resource "dynatrace_grail_security_context" "example" {
  entity_type          = var.grail_security_context_entity_type
  destination_property = var.grail_security_context_destination_property
}
