variable "zone_name" {
  description = "The name of the Dynatrace management zone to be created. Used for organizing monitored entities."
  type        = string
  default     = "default-zone"
}

variable "zone_description" {
  description = "Optional description for the management zone. Helpful for clarity in the Dynatrace UI."
  type        = string
  default     = "Zone for grouped observability across environment scope"
}

variable "zone_legacy_id" {
  description = "Legacy identifier for the zone (used when migrating or referencing preexisting configuration)."
  type        = string
  default     = "legacy-zone-001"
}

variable "entity_selector" {
  description = "Dynatrace entity selector string used to define zone membership via filter expressions."
  type        = string
  default     = "type(HOST),tag(\"env:prod\")"
}
