variable "auto_update" {
  description = "Enable automatic updates for ActiveGate"
  type        = bool
  default     = true
}

variable "scope_activegate" {
  description = "Scope identifier for ActiveGate updates (e.g., host group, environment ID)"
  type        = string
  default     = "environment:default"
}