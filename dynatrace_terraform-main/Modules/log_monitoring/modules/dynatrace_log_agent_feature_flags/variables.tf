variable "log_agent_feature_flags" {
  description = "Log agent feature flag configuration per scope"
  type = map(object({
    scope                      = string
    new_container_log_detector = bool
  }))
  default = {}
}