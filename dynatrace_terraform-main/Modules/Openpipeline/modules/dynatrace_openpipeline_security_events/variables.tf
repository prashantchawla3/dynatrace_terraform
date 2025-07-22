variable "enable_security_events" {
  description = "Enable ingestion of security-related events"
  type        = bool
  default     = true
}

variable "security_event_pipelines" {
  description = "List of security event pipelines enabled for threat detection"
  type = list(object({
    enabled      = bool
    display_name = string
    id           = string
  }))
  default = [
    {
      enabled      = true
      display_name = "Security Monitor"
      id           = "security-pipe-core"
    }
  ]
}
