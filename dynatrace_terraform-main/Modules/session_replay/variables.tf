variable "application_id" {
  description = "Logical application or environment identifier used to scope session replay settings."
  type        = string
  default     = "environment"
}

variable "enable_resource_capturing" {
  description = "Toggle to enable collection of static and dynamic resources for replay visualization."
  type        = bool
  default     = true
}

variable "resource_capture_url_exclusion_pattern_list" {
  description = "List of URL patterns to exclude from resource capture (e.g., tracking pixels, external services)."
  type        = list(string)
  default     = ["www.google.com"]
}

variable "enable_opt_in_mode" {
  description = "Toggle to enable opt-in mode for capturing user sessions, requiring explicit consent or matching logic."
  type        = bool
  default     = false
}

variable "url_exclusion_pattern_list" {
  description = "List of URL patterns where session replay recording should be excluded (e.g., sensitive paths)."
  type        = list(string)
  default     = ["www.google.com"]
}

variable "playback_masking_preset" {
  description = "Preset strategy for masking during playback. Options include MASK_ALL, ALLOW_LIST, or NONE."
  type        = string
  default     = "MASK_ALL"
}

variable "recording_masking_preset" {
  description = "Preset strategy for masking during recording. Options include ALLOW_LIST, BLOCK_ALL, or NONE."
  type        = string
  default     = "ALLOW_LIST"
}

variable "recording_masking_allow_list_rules" {
  description = "Allow list rules for masking during recording. Each rule defines a CSS selector and masking target scope."
  type = list(object({
    css_expression = string
    target         = string
  }))
  default = [
    {
      css_expression = "selector.example"
      target         = "ELEMENT"
    }
  ]
}
