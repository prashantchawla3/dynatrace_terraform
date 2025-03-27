variable "custom_units_name" {
  description = "Unit name has to be unique and is used as identifier"
  type        = string
}

variable "custom_units_description" {
  description = "Unit description should provide additional information about the new unit"
  type        = string
}

variable "custom_units_plural_name" {
  description = "Unit plural name represents the plural form of the unit name"
  type        = string
}

variable "custom_units_symbol" {
  description = "Unit symbol has to be unique"
  type        = string
}

variable "histogram_metrics_enable_histogram_bucket_ingest" {
  description = "Enable histogram bucket ingest"
  type        = bool
}

variable "metric_metadata_display_name" {
  description = "Display name"
  type        = string
}

variable "metric_metadata_metric_id" {
  description = "The scope of this setting (metric)"
  type        = string
}

variable "metric_metadata_unit" {
  description = "Unit"
  type        = string
}

variable "metric_query_metric_id" {
  description = "The scope of this setting (metric)"
  type        = string
}

variable "metric_query_metric_selector" {
  description = "Query"
  type        = string
}
