
variable "environment_url" { type = string }
variable "dynatrace_client_id" { type = string }
variable "dynatrace_client_secret" { type = string, sensitive = true }

variable "generic_relationships_enabled" { type = bool }
variable "generic_relationships_created_by" { type = string }
variable "generic_relationships_from_role" { type = string }
variable "generic_relationships_from_type" { type = string }
variable "generic_relationships_to_role" { type = string }
variable "generic_relationships_to_type" { type = string }
variable "generic_relationships_type_of_relation" { type = string }
variable "generic_relationships_sources_condition" { type = string }
variable "generic_relationships_sources_source_type" { type = string }

variable "generic_types_name" { type = string }
variable "generic_types_enabled" { type = bool }
variable "generic_types_created_by" { type = string }
variable "generic_types_display_name" { type = string }
variable "generic_types_rules_icon_pattern" { type = string }
variable "generic_types_rules_id_pattern" { type = string }
variable "generic_types_rules_instance_name_pattern" { type = string }
variable "generic_types_rules_attributes_key" { type = string }
variable "generic_types_rules_attributes_pattern" { type = string }
variable "generic_types_rules_required_dimensions_key" { type = string }
variable "generic_types_rules_sources_condition" { type = string }
variable "generic_types_rules_sources_source_type" { type = string }

variable "grail_security_context_entity_type" { type = string }
variable "grail_security_context_destination_property" { type = string }
