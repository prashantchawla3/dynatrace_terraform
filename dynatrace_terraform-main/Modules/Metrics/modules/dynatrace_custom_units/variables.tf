variable "custom_units_name" {
  description = "Unit name has to be unique and is used as identifier"
  type        = string
  default     = "latencyUnit"
}

variable "custom_units_description" {
  description = "Unit description should provide additional information about the new unit"
  type        = string
  default     = "Latency measurement unit used for custom metrics"
}

variable "custom_units_plural_name" {
  description = "Unit plural name represents the plural form of the unit name"
  type        = string
  default     = "latencies"
}

variable "custom_units_symbol" {
  description = "Unit symbol has to be unique"
  type        = string
  default     = "ms"
}
