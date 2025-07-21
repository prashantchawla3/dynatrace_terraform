variable "agent_optin_scope" {
  description = "Scope for the Dynatrace DevOps Agent Opt-in"
  type        = string
  default     = "environment"
}

variable "agent_optin_enabled" {
  description = "Enable or disable the Dynatrace DevOps Agent Opt-in"
  type        = bool
  default     = true
}