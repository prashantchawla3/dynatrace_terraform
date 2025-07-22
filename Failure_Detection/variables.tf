variable "existing_failure_detection_parameters_name" {
  description = "Name of the existing failure detection parameter set to reference"
  type        = string
  default     = ""
}

variable "failure_detection_parameters_enabled" {
  description = "Toggle to enable or disable custom failure detection parameters"
  type        = bool
  default     = true
}

variable "failure_detection_parameters_name" {
  description = "Name to assign to the failure detection parameters block"
  type        = string
  default     = "default-failure-detection"
}

variable "failure_detection_parameters_description" {
  description = "Description of the failure detection parameters set"
  type        = string
  default     = "Handles standard exceptions, 404s, and masking rules"
}

variable "http_404_not_found_failures" {
  description = "Enable detection of HTTP 404 Not Found errors as failures"
  type        = bool
  default     = true
}

variable "ignore_all_exceptions" {
  description = "Ignore all exceptions for failure detection"
  type        = bool
  default     = false
}

variable "ignore_span_failure_detection" {
  description = "Disable failure detection for span-based instrumentation"
  type        = bool
  default     = false
}

variable "custom_error_rules" {
  description = "Custom rules for marking request attributes as errors"
  type = list(object({
    request_attribute       = string
    compare_operation_type  = string
    case_sensitive          = optional(bool)
    text_value              = optional(string)
  }))
  default = []
}

variable "custom_handled_exceptions" {
  description = "List of handled exceptions that should be treated gracefully"
  type = list(object({
    class_pattern   = string
    message_pattern = string
  }))
  default = []
}

variable "ignored_exceptions" {
  description = "Exceptions to ignore during failure detection"
  type = list(object({
    class_pattern   = string
    message_pattern = string
  }))
  default = []
}

variable "success_forcing_exceptions" {
  description = "Exceptions that force transaction success despite normal failure detection"
  type = list(object({
    class_pattern   = string
    message_pattern = string
  }))
  default = []
}

variable "client_side_errors" {
  description = "Error class pattern for client-side failures"
  type        = string
  default     = "ClientError"
}

variable "server_side_errors" {
  description = "Error class pattern for server-side failures"
  type        = string
  default     = "ServerError"
}

variable "fail_on_missing_response_code_client_side" {
  description = "Mark client transactions as failed if response code is missing"
  type        = bool
  default     = false
}

variable "fail_on_missing_response_code_server_side" {
  description = "Mark server transactions as failed if response code is missing"
  type        = bool
  default     = false
}

variable "failure_detection_rules_enabled" {
  description = "Enable custom failure detection rules for services"
  type        = bool
  default     = true
}

variable "failure_detection_rules_name" {
  description = "Name to assign to the failure detection rules block"
  type        = string
  default     = "service-failure-ruleset"
}

variable "failure_conditions" {
  description = "List of conditions that determine transaction failure"
  type = list(object({
    attribute       = string
    case_sensitive  = bool
    predicate_type  = string
    text_values     = list(string)
  }))
  default = []
}

variable "service_failure_enabled" {
  description = "Enable service-level failure detection"
  type        = bool
  default     = true
}

variable "service_http_failure_enabled" {
  description = "Enable HTTP failure detection on services"
  type        = bool
  default     = true
}

variable "service_id" {
  description = "Unique identifier of the Dynatrace service for applying failure rules"
  type        = string
  default     = ""
}

variable "broken_link_domains" {
  description = "List of domains considered broken link targets"
  type        = list(string)
  default     = []
}

