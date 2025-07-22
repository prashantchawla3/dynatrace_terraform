variable "host_monitoring_advanced" {
  description = "Enable advanced monitoring features per host, like agent and code injection"
  type = list(object({
    host_id                 = string
    process_agent_injection = bool
    code_module_injection   = bool
  }))
  default = [
    {
      host_id                 = "host-01"
      process_agent_injection = true
      code_module_injection   = true
    }
  ]
}
