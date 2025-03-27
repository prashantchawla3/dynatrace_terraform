variable "calculated_synthetic_metric_name" {
  description = "The displayed name of the calculated synthetic metric"
  type        = string
}

variable "calculated_synthetic_metric_enabled" {
  description = "The metric is enabled (true) or disabled (false)"
  type        = bool
}

variable "calculated_synthetic_metric_metric" {
  description = "The type of the synthetic metric"
  type        = string
}

variable "calculated_synthetic_metric_metric_key" {
  description = "The unique key of the calculated synthetic metric"
  type        = string
}

variable "calculated_synthetic_metric_monitor_identifier" {
  description = "The Dynatrace entity ID of the monitor to which the metric belongs"
  type        = string
}

variable "synthetic_availability_exclude_maintenance_windows" {
  description = "Exclude periods with maintenance windows from availability calculation"
  type        = bool
}

variable "synthetic_location_name" {
  description = "The name of the location"
  type        = string
}

variable "synthetic_location_auto_update_chromium" {
  description = "Auto upgrade of Chromium is enabled (true) or disabled (false)"
  type        = bool
}

variable "synthetic_location_availability_location_outage" {
  description = "The alerting of location outage is enabled (true) or disabled (false)"
  type        = bool
}

variable "synthetic_location_availability_node_outage" {
  description = "The alerting of node outage is enabled (true) or disabled (false)"
  type        = bool
}

variable "synthetic_location_availability_notifications_enabled" {
  description = "The notifications of location and node outage is enabled (true) or disabled (false)"
  type        = bool
}

variable "synthetic_location_city" {
  description = "The city of the location"
  type        = string
}

variable "synthetic_location_country_code" {
  description = "The country code of the location"
  type        = string
}

variable "synthetic_location_deployment_type" {
  description = "The deployment type of the location"
  type        = string
}

variable "synthetic_location_latitude" {
  description = "The latitude of the location in DDD.dddd format"
  type        = number
}

variable "synthetic_location_location_node_outage_delay_in_minutes" {
  description = "Alert if the location or node outage lasts longer than X minutes"
  type        = number
}

variable "synthetic_location_longitude" {
  description = "The longitude of the location in DDD.dddd format"
  type        = number
}

variable "synthetic_location_region_code" {
  description = "The region code of the location"
  type        = string
}