variable "generic_relationships_enabled" {
  description = "Enable or disable the generic relationships resource"
  type        = bool
  default     = true
}

variable "generic_relationships_created_by" {
  description = "The user or extension that created this relationship"
  type        = string
  default     = "Terraform"
}

variable "generic_relationships_from_role" {
  description = "Specify a role for the source entity"
  type        = string
  default     = "terraformrole"
}

variable "generic_relationships_from_type" {
  description = "Define an entity type as the source of the relationship"
  type        = string
  default     = "os:service"
}

variable "generic_relationships_to_role" {
  description = "Specify a role for the destination entity"
  type        = string
  default     = "terraformrole"
}

variable "generic_relationships_to_type" {
  description = "Define an entity type as the destination of the relationship"
  type        = string
  default     = "terraformdestination"
}

variable "generic_relationships_type_of_relation" {
  description = "Type of the relationship"
  type        = string
  default     = "PART_OF"
}

variable "generic_relationships_sources_condition" {
  description = "Condition for the source"
  type        = string
  default     = "$eq(terraform)"
}

variable "generic_relationships_sources_source_type" {
  description = "Source type for the relationship"
  type        = string
  default     = "Metrics"
}

variable "generic_types_name" {
  description = "The entity type name"
  type        = string
  default     = "terraform:type"
}

variable "generic_types_enabled" {
  description = "Enable or disable the generic types resource"
  type        = bool
  default     = true
}

variable "generic_types_created_by" {
  description = "The user or extension that created this type"
  type        = string
  default     = "Terraform"
}

variable "generic_types_display_name" {
  description = "The human readable type name for this entity type"
  type        = string
  default     = "TerraformTest"
}

variable "generic_types_rules_icon_pattern" {
  description = "Pattern for the icon attribute"
  type        = string
  default     = "{TerraformIcon}"
}

variable "generic_types_rules_id_pattern" {
  description = "Pattern for the ID attribute"
  type        = string
  default     = "{TerraformPlaceholder}"
}

variable "generic_types_rules_instance_name_pattern" {
  description = "Pattern for the instance name attribute"
  type        = string
  default     = "{TerraformInstance}"
}

variable "generic_types_rules_attributes_key" {
  description = "Key for the attribute"
  type        = string
  default     = "TerraformAttribute"
}

variable "generic_types_rules_attributes_pattern" {
  description = "Pattern for the attribute"
  type        = string
  default     = "{TerraformExtraction}"
}

variable "generic_types_rules_required_dimensions_key" {
  description = "Key for the required dimension"
  type        = string
  default     = "TerraformDimension"
}

variable "generic_types_rules_sources_condition" {
  description = "Condition for the source"
  type        = string
  default     = "$eq(TerraformCondition)"
}

variable "generic_types_rules_sources_source_type" {
  description = "Source type for the rule"
  type        = string
  default     = "Events"
}

variable "grail_security_context_entity_type" {
  description = "Type of the entity whose security context to override"
  type        = string
  default     = "exampletype"
}

variable "grail_security_context_destination_property" {
  description = "The case-sensitive name of a property of the destination type"
  type        = string
  default     = "exampleproperty"
}
