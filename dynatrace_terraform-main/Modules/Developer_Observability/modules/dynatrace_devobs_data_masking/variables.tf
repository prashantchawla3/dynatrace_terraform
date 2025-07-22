
variable "data_masking_enabled" {
  description = "Enable or disable data masking"
  type        = bool
  default     = true
}

variable "data_masking_replacement_pattern" {
  description = "Pattern to replace sensitive data in masking rules"
  type        = string
  default     = ".*(password|token|secret).*"
}

variable "data_masking_replacement_type" {
  description = "Replacement type: MASK or REMOVE"
  type        = string
  default     = "MASK"
}

variable "data_masking_rule_name" {
  description = "Name of the data masking rule"
  type        = string
  default     = "Sensitive Fields Masking"
}

variable "data_masking_rule_type" {
  description = "Type of data masking rule (e.g., header, parameter)"
  type        = string
  default     = "header"
}

variable "data_masking_rule_var_name" {
  description = "Name of the variable or field to mask in the rule"
  type        = string
  default     = "authorization"
}
