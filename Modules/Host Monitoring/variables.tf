variable "aix_extensions" {
  description = "Enable or disable Dynatrace AIX monitoring extensions per host"
  type = list(object({
    host_id             = string
    use_global_settings = bool
    enabled             = bool
  }))
  default = [
    { host_id = "host-aix-01", use_global_settings = true, enabled = true }
  ]
}

variable "crashdump_analytics" {
  description = "Enable crash dump analytics per host for diagnostic correlation"
  type = list(object({
    host_id                     = string
    enable_crash_dump_analytics = bool
  }))
  default = [
    { host_id = "host-01", enable_crash_dump_analytics = true }
  ]
}

variable "disk_analytics" {
  description = "Enable disk analytics on scoped hosts"
  type = list(object({
    enabled = bool
    scope   = string
  }))
  default = [
    { enabled = true, scope = "env:prod" }
  ]
}

variable "ebpf_service_discovery" {
  description = "Enable eBPF-based service discovery for deep process analytics"
  type = list(object({
    ebpf  = bool
    scope = string
  }))
  default = [
    { ebpf = true, scope = "kubernetes:apps" }
  ]
}

variable "host_monitoring" {
  description = "Enable or disable base-level host monitoring by ID"
  type = list(object({
    enabled = bool
    host_id = string
  }))
  default = [
    { enabled = true, host_id = "host-analytics-01" }
  ]
}

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

variable "host_monitoring_modes" {
  description = "Set monitoring mode per host (e.g., FULL_STACK, INFRA_ONLY)"
  type = list(object({
    host_id         = string
    monitoring_mode = string
  }))
  default = [
    { host_id = "host-01", monitoring_mode = "FULL_STACK" }
  ]
}

variable "host_naming" {
  description = "Override host display naming rules with custom format"
  type = list(object({
    enabled = bool
    format  = string
    name    = string
  }))
  default = [
    {
      enabled = true
      format  = "{HostName}-{Environment}"
      name    = "prod-host-eu"
    }
  ]
}

variable "host_process_group_monitoring" {
  description = "Configure monitoring states for specific process groups on a host"
  type = list(object({
    host_id          = string
    monitoring_state = string
    process_group    = string
  }))
  default = [
    { host_id = "host-01", monitoring_state = "MONITORING_ENABLED", process_group = "nginx" }
  ]
}

variable "net_tracers" {
  description = "Enable Dynatrace net tracer monitoring on scoped entities"
  type = list(object({
    scope      = string
    net_tracer = bool
  }))
  default = [
    { scope = "host:east", net_tracer = true }
  ]
}

variable "network_traffic" {
  description = "Define custom network traffic endpoints per host and interface"
  type = list(object({
    host_id    = string
    ip_address = string
    interface  = string
    os         = string
  }))
  default = [
    {
      host_id    = "host-01"
      ip_address = "10.10.10.10"
      interface  = "eth0"
      os         = "linux"
    }
  ]
}

variable "os_services" {
  description = "Configure operating system service monitoring rules with conditions"
  type = list(object({
    name                      = string
    enabled                   = bool
    alert_activation_duration = number
    alerting                  = bool
    monitoring                = bool
    not_installed_alerting    = bool
    scope                     = string
    status_condition_linux    = string
    system                    = string
    condition                 = string
    property                  = string
    metadata_key              = string
    metadata_value            = string
  }))
  default = [
    {
      name                      = "ssh"
      enabled                   = true
      alert_activation_duration = 300
      alerting                  = true
      monitoring                = true
      not_installed_alerting    = false
      scope                     = "host:linux-secure"
      status_condition_linux    = "active"
      system                    = "systemd"
      condition                 = "equals"
      property                  = "status"
      metadata_key              = "env"
      metadata_value            = "prod"
    }
  ]
}
