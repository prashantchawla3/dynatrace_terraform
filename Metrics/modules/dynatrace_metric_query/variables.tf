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
