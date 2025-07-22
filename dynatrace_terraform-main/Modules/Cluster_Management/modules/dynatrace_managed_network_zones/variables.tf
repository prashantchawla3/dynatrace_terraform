variable "network_zone_name" {
  description = "The name of the network zone"
  type        = string
  default     = "default-zone"
}

variable "network_zone_description" {
  description = "A description of the network zone"
  type        = string
  default     = "Primary network zone for Dynatrace Managed"
}

variable "network_zone_alternative_zones" {
  description = "List of alternative network zones for failover"
  type        = list(string)
  default     = ["backup-zone-1", "backup-zone-2"]
}

variable "network_zone_fallback_mode" {
  description = "Fallback mode to use when the primary zone is unavailable (e.g., AUTO, MANUAL)"
  type        = string
  default     = "AUTO"
}
