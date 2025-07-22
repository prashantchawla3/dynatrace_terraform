variable "metric_metadata_display_name" {
  description = "Display name for the custom metric shown in Dynatrace UI"
  type        = string
  default     = "Frontend Latency"
}

variable "metric_metadata_metric_id" {
  description = "The unique identifier of the metric for which metadata is applied"
  type        = string
  default     = "custom.latency.frontend"
}

variable "metric_metadata_unit" {
  description = "Unit symbol used for the metric metadata (e.g., ms, MB, ops)"
  type        = string
  default     = "ms"
}
