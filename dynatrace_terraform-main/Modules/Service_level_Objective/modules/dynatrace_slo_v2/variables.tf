variable "slo_name" {
  description = "Logical name of the SLO displayed in Dynatrace UI."
  type        = string
  default     = "Availability SLO"
}

variable "slo_enabled" {
  description = "Toggle to enable or disable SLO provisioning."
  type        = bool
  default     = true
}

variable "slo_description" {
  description = "Human-readable description of the SLO for reporting and UI context."
  type        = string
  default     = "Tracks availability of key services based on error rate expression."
}

variable "slo_evaluation_type" {
  description = "Evaluation method used to calculate SLO status (e.g., STATIC, SLIDING)."
  type        = string
  default     = "STATIC"
}

variable "slo_evaluation_window" {
  description = "Evaluation time window (e.g., LAST_7_DAYS, LAST_30_DAYS) for reporting compliance."
  type        = string
  default     = "LAST_7_DAYS"
}

variable "slo_filter" {
  description = "Entity selector filter used to scope the SLO to specific services or environments."
  type        = string
  default     = "type(SERVICE),tag([Team:Platform])"
}

variable "slo_metric_expression" {
  description = "Metric expression used to evaluate SLO status (e.g., success rate or error rate)."
  type        = string
  default     = "(100 - builtin:service.errors.total.count:splitBy())"
}

variable "slo_metric_name" {
  description = "Logical name or key of the custom metric used in the SLO expression."
  type        = string
  default     = "synthetic_success_rate"
}

variable "slo_target_success" {
  description = "Target threshold (%) required for SLO to be considered successful."
  type        = number
  default     = 99.95
}

variable "slo_target_warning" {
  description = "Warning threshold (%) below which SLO status is flagged for review."
  type        = number
  default     = 99.0
}

variable "slo_legacy_id" {
  description = "Optional legacy or internal SLO identifier used for migration or tracking."
  type        = string
  default     = "slo-platform-core"
}

variable "burn_rate_visualization_enabled" {
  description = "Enable burn rate charting and alert visualization in the UI."
  type        = bool
  default     = true
}

variable "fast_burn_threshold" {
  description = "Optional threshold value for identifying fast burn rate conditions; null disables logic."
  type        = number
  default     = null
}
