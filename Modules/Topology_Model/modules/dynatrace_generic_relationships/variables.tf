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
