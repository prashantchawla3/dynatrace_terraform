<<<<<<< HEAD

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
=======
variable "slo_name" {
  description = "SLO name"
  type        = string
}

variable "slo_enabled" {
  description = "This setting is enabled (true) or disabled (false)"
  type        = bool
  default     = true
}

variable "slo_description" {
  description = "The description of the SLO"
  type        = string
  default     = "Terraform Test"
}

variable "slo_evaluation_type" {
  description = "Evaluation type"
  type        = map(string)
  default     = "AGGREGATE"
}

variable "slo_evaluation_window" {
  description = "Evaluation window"
  type        = string
  default     = "-1w"
}

variable "slo_filter" {
  description = "Filter parameter"
  type        = string
  default     = "type(SERVICE),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE)"
}

variable "slo_metric_expression" {
  description = "Metric expression"
  type        = string
  default     = "100*(builtin:service.requestCount.server:splitBy())/(builtin:service.requestCount.server:splitBy())"
}

variable "slo_metric_name" {
  description = "Metric name"
  type        = string
  default     = "terraform_test"
}

variable "slo_target_success" {
  description = "Target success value"
  type        = number
  default     = 95
}

variable "slo_target_warning" {
  description = "Target warning value"
  type        = number
  default     = 98
}

variable "slo_legacy_id" {
  description = "Legacy ID"
  type        = string
  default     = ""
}

variable "burn_rate_visualization_enabled" {
  description = "Burn rate visualization enabled"
  type        = bool
  default     = false
}

variable "fast_burn_threshold" {
  description = "Fast burn threshold"
  type        = number
  default     = null
}
>>>>>>> ad57492bee2113e1b0f659c12b0108fea33b48f1
