variable "auto_update" {
  description = "Automatic updates at earliest convenience"
  type        = bool
}

variable "scope_activegate" {
  description = "The scope of this setting (ENVIRONMENT_ACTIVE_GATE). Omit this property if you want to cover the whole environment."
  type        = string
  default     = "environment"
}

variable "scope_oneagent" {
  description = "The scope of this setting (HOST, HOST_GROUP). Omit this property if you want to cover the whole environment."
  type        = string
  default     = "environment"
}

variable "target_version" {
  description = "Target version"
  type        = string
  default     = "latest"
}

variable "update_mode" {
  description = "Update mode"
  type        = string
  default     = "AUTOMATIC"
}

variable "name" {
  description = "Name"
  type        = string
}

variable "enabled" {
  description = "This setting is enabled (true) or disabled (false)"
  type        = bool
}

variable "recurrence" {
  description = "Recurrence type"
  type        = string
  default     = "ONCE"
}

variable "once_recurrence_end" {
  description = "End time for once recurrence"
  type        = string
}

variable "once_recurrence_start" {
  description = "Start time for once recurrence"
  type        = string
}