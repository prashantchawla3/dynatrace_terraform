variable "synthetic_location_name" {
  description = "Name of the custom synthetic location."
  type        = string
  default     = "Private Location"
}

variable "synthetic_location_auto_update_chromium" {
  description = "Enable auto-update for Chromium used by the synthetic agent."
  type        = bool
  default     = true
}

variable "synthetic_location_availability_location_outage" {
  description = "Enable reporting of location-level outages."
  type        = bool
  default     = true
}

variable "synthetic_location_availability_node_outage" {
  description = "Enable reporting of node-level outages inside this location."
  type        = bool
  default     = false
}

variable "synthetic_location_availability_notifications_enabled" {
  description = "Enable alert notifications for outages at this synthetic location."
  type        = bool
  default     = true
}

variable "synthetic_location_city" {
  description = "City label for the synthetic location."
  type        = string
  default     = "Nairobi"
}

variable "synthetic_location_country_code" {
  description = "ISO 3166 country code for the location."
  type        = string
  default     = "KE"
}

variable "synthetic_location_deployment_type" {
  description = "Deployment type of the location (e.g. PRIVATE or PUBLIC)."
  type        = string
  default     = "PRIVATE"
}

variable "synthetic_location_latitude" {
  description = "Latitude coordinate for synthetic location geolocation."
  type        = number
  default     = -1.2921
}

variable "synthetic_location_location_node_outage_delay_in_minutes" {
  description = "Delay in minutes before detecting node outage."
  type        = number
  default     = 5
}

variable "synthetic_location_longitude" {
  description = "Longitude coordinate for synthetic location geolocation."
  type        = number
  default     = 36.8219
}

variable "synthetic_location_region_code" {
  description = "Custom region label used for grouping locations."
  type        = string
  default     = "AF-EA"
}

variable "enable_synthetic_location" {
  description = "Master switch to enable synthetic location creation."
  type        = bool
  default     = true
}
