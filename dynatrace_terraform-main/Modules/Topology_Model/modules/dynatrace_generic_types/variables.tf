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