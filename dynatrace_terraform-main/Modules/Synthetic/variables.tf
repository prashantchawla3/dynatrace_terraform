# ──  Calculated Synthetic Metric ─────────────────────────
variable "calculated_synthetic_metric_name" {
  description = "Unique name for the calculated synthetic metric being defined."
  type        = string
  default     = "SyntheticMetric:ResponseTimeThreshold"
}

variable "calculated_synthetic_metric_enabled" {
  description = "Toggle to enable or disable creation of the calculated synthetic metric."
  type        = bool
  default     = true
}

variable "calculated_synthetic_metric_metric" {
  description = "Source metric identifier used to calculate the synthetic metric."
  type        = string
  default     = "builtin:synmon.response.time"
}

variable "calculated_synthetic_metric_metric_key" {
  description = "Logical key for identifying the calculated metric formula or scope."
  type        = string
  default     = "calc.synthetic.response.threshold"
}

variable "calculated_synthetic_metric_monitor_identifier" {
  description = "Monitor ID or tag used to scope the calculated synthetic metric."
  type        = string
  default     = "SYNTH_MONITOR_WEB_AFRICA"
}

# ──  Synthetic Availability ─────────────────────────────
variable "synthetic_availability_exclude_maintenance_windows" {
  description = "Exclude maintenance windows from availability calculations if set to true."
  type        = bool
  default     = false
}

# ──  Synthetic Location Configuration ───────────────────
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

# ──  Enable Switches ────────────────────────────────────
variable "enable_calculated_synthetic_metric" {
  description = "Master switch to enable calculated synthetic metric provisioning."
  type        = bool
  default     = true
}

variable "enable_synthetic_availability" {
  description = "Master switch to enable synthetic availability rules."
  type        = bool
  default     = true
}

variable "enable_synthetic_location" {
  description = "Master switch to enable synthetic location creation."
  type        = bool
  default     = true
}
