variable "dashboard_name" {
  description = "The name of the dashboard"
  type        = string
  default     = "Example Dashboard"
}

variable "dashboard_shared" {
  description = "Whether the dashboard is shared"
  type        = bool
  default     = true
}

variable "dashboard_owner" {
  description = "The owner of the dashboard"
  type        = string
  default     = "Dynatrace"
}

variable "dashboard_tags" {
  description = "Tags for the dashboard"
  type        = list(string)
  default     = ["Example"]
}

variable "dashboard_preset" {
  description = "Whether the dashboard is a preset"
  type        = bool
  default     = false
}

variable "metric_name" {
  description = "The metric name for the custom chart"
  type        = string
  default     = "ext:cloud.azure.microsoft_cognitiveservices.accounts.successfulcalls"
}