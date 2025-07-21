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

variable "enable_calculated_synthetic_metric" {
  description = "Master switch to enable calculated synthetic metric provisioning."
  type        = bool
  default     = true
}