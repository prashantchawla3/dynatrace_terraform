variable "zone_name" {
  description = "The name of the management zone"
  type        = string
}

variable "zone_description" {
  description = "The description of the management zone"
  type        = string
}

variable "zone_legacy_id" {
  description = "The legacy ID of the management zone"
  type        = string
}

variable "entity_selector" {
  description = "The entity selector for the management zone rules"
  type        = string
}