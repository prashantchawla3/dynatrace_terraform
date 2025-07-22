
variable "outgoing_enabled" {
  description = "Enable or disable OneAgent outgoing events"
  type        = bool
  default     = true
}

variable "outgoing_category_source" {
  description = "Source value for outgoing event category"
  type        = string
  default     = "Payment"
}

variable "outgoing_category_source_type" {
  description = "Source type for outgoing event category"
  type        = string
  default     = "STATIC"
}

variable "outgoing_field_name" {
  description = "Name of the outgoing event data field"
  type        = string
  default     = "outgoingField"
}

variable "outgoing_field_path" {
  description = "Path for the outgoing event data field"
  type        = string
  default     = "$.outgoing.field"
}

variable "outgoing_field_source_type" {
  description = "Source type for the outgoing event data field"
  type        = string
  default     = "JSON"
}

variable "outgoing_provider_source" {
  description = "Source value for the outgoing provider"
  type        = string
  default     = "ThirdParty"
}

variable "outgoing_provider_source_type" {
  description = "Source type for the outgoing provider"
  type        = string
  default     = "STATIC"
}

variable "outgoing_type_source" {
  description = "Source value for the outgoing event type"
  type        = string
  default     = "Invoice"
}

variable "outgoing_type_source_type" {
  description = "Source type for the outgoing event type"
  type        = string
  default     = "STATIC"
}

variable "outgoing_trigger_type" {
  description = "Trigger type for outgoing events"
  type        = string
  default     = "EQUALS"
}

variable "outgoing_trigger_case_sensitive" {
  description = "Whether the outgoing trigger is case sensitive"
  type        = bool
  default     = false
}

variable "outgoing_trigger_value" {
  description = "Value to match for the outgoing trigger"
  type        = string
  default     = "invoice-sent"
}

variable "outgoing_trigger_data_source" {
  description = "Data source for the outgoing trigger"
  type        = string
  default     = "BODY"
}