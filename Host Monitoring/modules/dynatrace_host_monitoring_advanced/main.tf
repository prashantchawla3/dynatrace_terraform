resource "dynatrace_host_monitoring_advanced" "example" {
  count                   = length(var.host_monitoring_advanced)
  host_id                 = var.host_monitoring_advanced[count.index].host_id
  process_agent_injection = var.host_monitoring_advanced[count.index].process_agent_injection
  code_module_injection   = var.host_monitoring_advanced[count.index].code_module_injection
}
