variable "application_id" {
  description = "The scope of this settings. If the settings should cover the whole environment, just don't specify any scope."
  type        = string
  default     = "environment"
}

variable "enable_resource_capturing" {
  description = "When turned on, Dynatrace captures resources for up to 0.1% of user sessions recorded with Session Replay."
  type        = bool
  default     = true
}

variable "resource_capture_url_exclusion_pattern_list" {
  description = "Add exclusion rules to avoid the capture of resources from certain pages."
  type        = list(string)
  default     = ["www.google.com"]
}

variable "enable_opt_in_mode" {
  description = "When Session Replay opt-in mode is turned on, Session Replay is deactivated until explicitly activated via an API call."
  type        = bool
  default     = false
}

variable "url_exclusion_pattern_list" {
  description = "Exclude webpages or views from Session Replay recording by adding URL exclusion rules."
  type        = list(string)
  default     = ["www.google.com"]
}

variable "playback_masking_preset" {
  description = "Predefined masking options for playback."
  type        = string
  default     = "MASK_ALL"
}

variable "recording_masking_preset" {
  description = "Predefined masking options for recording."
  type        = string
  default     = "ALLOW_LIST"
}

variable "recording_masking_allow_list_rules_css_expression" {
  description = "CSS expression for the allow list rule."
  type        = string
  default     = "selector.example"
}

variable "recording_masking_allow_list_rules_target" {
  description = "Target for the allow list rule."
  type        = string
  default     = "ELEMENT"
}