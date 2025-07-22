
variable "processing_enabled" {
  description = "Enable or disable business events processing"
  type        = bool
  default     = true
}

variable "processing_matcher" {
  description = "Matcher expression for processing"
  type        = string
  default     = "status == \"complete\""
}

variable "processing_script" {
  description = "Script used for processing"
  type        = string
  default     = "return payload.status == 'complete';"
}
