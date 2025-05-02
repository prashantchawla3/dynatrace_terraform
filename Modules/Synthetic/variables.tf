
variable "environment_url" {
  type        = string
  description = "Dynatrace environment URL"
}

variable "dynatrace_client_id" {
  type        = string
  description = "Dynatrace OAuth client ID"
}

variable "dynatrace_client_secret" {
  type        = string
  description = "Dynatrace OAuth client secret"
  sensitive   = true
}

# Calculated Synthetic Metric
variable "calculated_synthetic_metric_name" { type = string }
variable "calculated_synthetic_metric_enabled" { type = bool }
variable "calculated_synthetic_metric_metric" { type = string }
variable "calculated_synthetic_metric_metric_key" { type = string }
variable "calculated_synthetic_metric_monitor_identifier" { type = string }

# Synthetic Availability
variable "synthetic_availability_exclude_maintenance_windows" { type = bool }

# Synthetic Location
variable "synthetic_location_name" { type = string }
variable "synthetic_location_auto_update_chromium" { type = bool }
variable "synthetic_location_availability_location_outage" { type = bool }
variable "synthetic_location_availability_node_outage" { type = bool }
variable "synthetic_location_availability_notifications_enabled" { type = bool }
variable "synthetic_location_city" { type = string }
variable "synthetic_location_country_code" { type = string }
variable "synthetic_location_deployment_type" { type = string }
variable "synthetic_location_latitude" { type = number }
variable "synthetic_location_location_node_outage_delay_in_minutes" { type = number }
variable "synthetic_location_longitude" { type = number }
variable "synthetic_location_region_code" { type = string }

variable "enable_calculated_synthetic_metric" {
  description = "Whether to create the calculated synthetic metric"
  type        = bool
  default     = true
}

variable "enable_synthetic_availability" {
  description = "Whether to create the synthetic availability resource"
  type        = bool
  default     = true
}

variable "enable_synthetic_location" {
  description = "Whether to create the synthetic location resource"
  type        = bool
  default     = true
}
