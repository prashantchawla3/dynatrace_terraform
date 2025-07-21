variable "request_attribute_name" {
  description = "Name of the request attribute to be extracted."
  type        = string
  default     = "x-trace-id"
}

variable "request_attribute_enabled" {
  description = "Flag to enable extraction of the request attribute."
  type        = bool
  default     = true
}

variable "request_attribute_aggregation" {
  description = "Aggregation strategy for attribute values (e.g. FIRST, LAST)."
  type        = string
  default     = "FIRST"
}

variable "request_attribute_confidential" {
  description = "If true, treats the attribute value as sensitive."
  type        = bool
  default     = false
}

variable "request_attribute_data_type" {
  description = "Data type of the request attribute (e.g. STRING, NUMBER)."
  type        = string
  default     = "STRING"
}

variable "request_attribute_normalization" {
  description = "Normalization behavior applied (e.g. NONE, LOWERCASE)."
  type        = string
  default     = "NONE"
}

variable "request_attribute_skip_personal_data_masking" {
  description = "Flag to skip Dynatrace's personal data masking."
  type        = bool
  default     = false
}