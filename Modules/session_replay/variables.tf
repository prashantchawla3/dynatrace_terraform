variable "application_id" {
  description = "Application or environment scope."
  type        = string
  default     = "environment"
}

variable "enable_resource_capturing" {
  description = "Enable resource capturing."
  type        = bool
  default     = true
}

variable "resource_capture_url_exclusion_pattern_list" {
  description = "URL exclusion patterns for resource capture."
  type        = list(string)
  default     = ["www.google.com"]
}

variable "enable_opt_in_mode" {
  description = "Enable opt-in mode for session replay."
  type        = bool
  default     = false
}

variable "url_exclusion_pattern_list" {
  description = "URL exclusion patterns for session replay."
  type        = list(string)
  default     = ["www.google.com"]
}

variable "playback_masking_preset" {
  description = "Preset for playback masking."
  type        = string
  default     = "MASK_ALL"
}

variable "recording_masking_preset" {
  description = "Preset for recording masking."
  type        = string
  default     = "ALLOW_LIST"
}

variable "recording_masking_allow_list_rules_css_expression" {
  description = "CSS expression for allow list rule."
  type        = string
  default     = "selector.example"
}

variable "recording_masking_allow_list_rules_target" {
  description = "Target for allow list rule."
  type        = string
  default     = "ELEMENT"
}