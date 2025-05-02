
variable "environment_url" { type = string }
variable "dynatrace_client_id" { type = string }
variable "dynatrace_client_secret" { type = string, sensitive = true }

variable "slo_name" { type = string }
variable "slo_enabled" { type = bool }
variable "slo_description" { type = string }
variable "slo_evaluation_type" { type = string }
variable "slo_evaluation_window" { type = string }
variable "slo_filter" { type = string }
variable "slo_metric_expression" { type = string }
variable "slo_metric_name" { type = string }
variable "slo_target_success" { type = number }
variable "slo_target_warning" { type = number }
variable "slo_legacy_id" { type = string }
variable "burn_rate_visualization_enabled" { type = bool }
variable "fast_burn_threshold" { type = number, default = null }
