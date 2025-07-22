variable "metric_name" {
  description = "Display name of the custom metric being created."
  type        = string
  default     = "Request Duration"
}

variable "metric_enabled" {
  description = "Flag to enable or disable creation of the custom metric."
  type        = bool
  default     = true
}

variable "management_zones" {
  description = "List of management zones used for visibility or scoping."
  type        = list(string)
  default     = ["Platform"]
}

variable "metric_key" {
  description = "Logical key of the metric used for referencing internally."
  type        = string
  default     = "easytrade.req.duration"
}

variable "metric_unit" {
  description = "Unit of measurement for the custom metric."
  type        = string
  default     = "MICRO_SECOND"
}

variable "condition_attribute" {
  description = "Attribute used to scope the condition rule (e.g. URL_PATH, HTTP_METHOD)."
  type        = string
  default     = "URL_PATH"
}

variable "comparison_negate" {
  description = "If true, the condition result will be inverted."
  type        = bool
  default     = false
}

variable "http_method_operator" {
  description = "Operator used for HTTP method comparison (e.g. CONTAINS)."
  type        = string
  default     = "EQUALS"
}

variable "http_method_values" {
  description = "List of HTTP methods used for condition filtering."
  type        = list(string)
  default     = ["GET", "POST"]
}

variable "metric_definition_metric" {
  description = "Dynatrace metric expression or builtin name."
  type        = string
  default     = "builtin:service.response.time"
}

variable "metric_definition_request_attribute" {
  description = "Request attribute used as a source for the custom metric."
  type        = string
  default     = "x-response-time"
}
