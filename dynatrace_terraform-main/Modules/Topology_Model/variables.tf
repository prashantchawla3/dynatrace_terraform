# ── Generic Relationship Mapping ───────────────────────────
variable "generic_relationships_enabled" {
  description = "Enable creation of generic entity relationships."
  type        = bool
  default     = true
}

variable "generic_relationships_created_by" {
  description = "Identifier of automation or team that created the relationship definition."
  type        = string
  default     = "automation-team"
}

variable "generic_relationships_from_role" {
  description = "Role assigned to the 'from' entity in the relationship graph."
  type        = string
  default     = "owner"
}

variable "generic_relationships_from_type" {
  description = "Entity type of the source node (e.g., host, service)."
  type        = string
  default     = "host"
}

variable "generic_relationships_to_role" {
  description = "Role assigned to the 'to' entity in the relationship graph."
  type        = string
  default     = "backend"
}

variable "generic_relationships_to_type" {
  description = "Entity type of the destination node (e.g., service, database)."
  type        = string
  default     = "service"
}

variable "generic_relationships_type_of_relation" {
  description = "Semantic label describing the nature of the relationship."
  type        = string
  default     = "communicates_with"
}

variable "generic_relationships_sources_condition" {
  description = "Filter condition applied to the relationship source definition."
  type        = string
  default     = "key == 'region'"
}

variable "generic_relationships_sources_source_type" {
  description = "Source type used in the relationship mapping (e.g., METADATA, ENTITY)."
  type        = string
  default     = "METADATA"
}

# ── Generic Entity Type Definition ────────────────────────
variable "generic_types_name" {
  description = "Logical identifier for the generic entity type."
  type        = string
  default     = "custom_host_type"
}

variable "generic_types_enabled" {
  description = "Toggle for enabling the generic entity type definition."
  type        = bool
  default     = true
}

variable "generic_types_created_by" {
  description = "Author or automation origin for the entity type definition."
  type        = string
  default     = "terraform-module"
}

variable "generic_types_display_name" {
  description = "Human-readable label for the entity type in Dynatrace UI."
  type        = string
  default     = "Custom Host Type"
}

variable "generic_types_rules_icon_pattern" {
  description = "Pattern used to determine the icon for the entity."
  type        = string
  default     = "os:linux"
}

variable "generic_types_rules_id_pattern" {
  description = "Pattern used to resolve the entity ID."
  type        = string
  default     = "{host.name}"
}

variable "generic_types_rules_instance_name_pattern" {
  description = "Pattern for naming entity instances."
  type        = string
  default     = "{host.name} - {environment}"
}

variable "generic_types_rules_attributes_key" {
  description = "Metadata key used for attribute extraction."
  type        = string
  default     = "environment"
}

variable "generic_types_rules_attributes_pattern" {
  description = "Pattern used for attribute value extraction."
  type        = string
  default     = ".*prod.*"
}

variable "generic_types_rules_required_dimensions_key" {
  description = "Required dimension key for entity detection."
  type        = string
  default     = "region"
}

variable "generic_types_rules_sources_condition" {
  description = "Condition for selecting entity source data."
  type        = string
  default     = "environment == 'prod'"
}

variable "generic_types_rules_sources_source_type" {
  description = "Source type used in entity definition (e.g., METADATA, LOGS)."
  type        = string
  default     = "METADATA"
}

# ── Grail Security Context ────────────────────────────────
variable "grail_security_context_entity_type" {
  description = "Entity type for which Grail security context applies."
  type        = string
  default     = "user"
}

variable "grail_security_context_destination_property" {
  description = "Target field used to apply security context scoping."
  type        = string
  default     = "email"
}
