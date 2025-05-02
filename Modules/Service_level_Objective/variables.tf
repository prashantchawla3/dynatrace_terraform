
variable "environment_url" {
  type        = string
  description = "Dynatrace environment URL"
}

variable "dynatrace_client_id" {
  type        = string
  description = "OAuth client ID"
}

variable "dynatrace_client_secret" {
  type        = string
  description = "OAuth client secret"
  sensitive   = true
}

variable "slo_name" {
  type        = string
  description = "Name of the SLO"
}

variable "slo_enabled" {
  type        = bool
  description = "Whether the SLO is enabled"
}

variable "slo_description" {
  type        = string
  description = "Custom description of the SLO"
}

variable "slo_evaluation_type" {
  type        = string
  description = "Evaluation type (AGGREGATE, SINGLE_VALUE)"
}

variable "slo_evaluation_window" {
  type        = string
  description = "Evaluation window duration (e.g., -1w, -24h)"
}

variable "slo_filter" {
  type        = string
  description = "Filter criteria for the metric"
}

variable "slo_metric_expression" {
  type        = string
  description = "Metric expression for the SLO"
}

variable "slo_metric_name" {
  type        = string
  description = "Metric name"
}

variable "slo_target_success" {
  type        = number
  description = "Target success threshold"
}

variable "slo_target_warning" {
  type        = number
  description = "Warning threshold"
}

variable "slo_legacy_id" {
  type        = string
  description = "Optional legacy ID"
}

variable "burn_rate_visualization_enabled" {
  type        = bool
  description = "Enable burn rate visualization"
}

variable "fast_burn_threshold" {
  type        = number
  default     = null
  description = "Fast burn threshold value"
}
