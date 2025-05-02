variable "aix_extensions" {
  description = "List of AIX extensions to be configured."
  type = list(object({
    host_id             = string
    use_global_settings = bool
    enabled             = bool
  }))
}

variable "crashdump_analytics" {
  description = "List of crash dump analytics configurations."
  type = list(object({
    host_id                   = string
    enable_crash_dump_analytics = bool
  }))
}

variable "disk_analytics" {
  description = "List of disk analytics configurations."
  type = list(object({
    enabled = bool
    scope   = string
  }))
}

variable "ebpf_service_discovery" {
  description = "List of eBPF service discovery configurations."
  type = list(object({
    ebpf  = bool
    scope = string
  }))
}

variable "host_monitoring" {
  description = "List of host monitoring configurations."
  type = list(object({
    enabled = bool
    host_id = string
  }))
}

variable "host_monitoring_advanced" {
  description = "List of advanced host monitoring configurations."
  type = list(object({
    host_id                 = string
    process_agent_injection = bool
    code_module_injection   = bool
  }))
}

variable "host_monitoring_modes" {
  description = "List of host monitoring modes configurations."
  type = list(object({
    host_id           = string
    monitoring_mode   = string
  }))
}

variable "host_naming" {
  description = "List of host naming configurations."
  type = list(object({
    enabled = bool
    format  = string
    name    = string
  }))
}

variable "host_process_group_monitoring" {
  description = "List of host process group monitoring configurations."
  type = list(object({
    host_id           = string
    monitoring_state  = string
    process_group     = string
  }))
}

variable "net_tracers" {
  description = "List of network tracer configurations."
  type = list(object({
    scope      = string
    net_tracer = string
  }))
}

variable "network_traffic" {
  description = "List of network traffic configurations."
  type = list(object({
    host_id = string
    ip_address  = string
    interface   = string
    os          = string
  }))
}

variable "os_services" {
  description = "List of OS service configurations."
  type = list(object({
    name                      = string
    enabled                   = bool
    alert_activation_duration = string
    alerting                  = bool
    monitoring                = bool
    not_installed_alerting    = bool
    scope                     = string
    status_condition_linux    = string
    system                    = string
    condition                = string
    property                 = string
    metadata_key             = string
    metadata_value           = string
  }))
}

variable "host_naming_orders" {
  description = "List of host naming orders configurations."
  type = list(object({
    naming_rule_ids = list(string)
  }))
}
