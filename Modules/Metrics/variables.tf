variable "custom_units_name" {
  description = "Unit name has to be unique and is used as identifier"
  type        = string
  default     = "latencyUnit"
}

variable "custom_units_description" {
  description = "Unit description should provide additional information about the new unit"
  type        = string
  default     = "Latency measurement unit used for custom metrics"
}

variable "custom_units_plural_name" {
  description = "Unit plural name represents the plural form of the unit name"
  type        = string
  default     = "latencies"
}

variable "custom_units_symbol" {
  description = "Unit symbol has to be unique"
  type        = string
  default     = "ms"
}

variable "histogram_metrics_enable_histogram_bucket_ingest" {
  description = "Enable histogram bucket ingest for custom histogram metrics"
  type        = bool
  default     = true
}

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

variable "metric_query_metric_id" {
  description = "The unique identifier of the metric used in the query"
  type        = string
  default     = "custom.latency.frontend"
}

variable "metric_query_metric_selector" {
  description = "Metric selector expression for querying metric data"
  type        = string
  default     = "custom.latency.frontend:avg:splitBy()"
}
