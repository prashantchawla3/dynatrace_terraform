api_url  = "https://your-dynatrace-api-url"
api_token = "your-dynatrace-api-token"

aix_extensions = [
  {
    host_id             = "host1"
    use_global_settings = true
    enabled             = true
  }
]

crashdump_analytics = [
  {
    host_id                   = "host1"
    enable_crash_dump_analytics = true
  }
]

disk_analytics = [
  {
    enabled = true
    scope   = "ALL"
  }
]

ebpf_service_discovery = [
  {
    ebpf  = true
    scope = "ALL"
  }
]

host_monitoring = [
  {
    enabled = true
    host_id = "host1"
  }
]

host_monitoring_advanced = [
  {
    host_id                 = "host1"
    process_agent_injection = true
    code_module_injection   = true
  }
]

host_monitoring_modes = [
  {
    host_id         = "host1"
    monitoring_mode = "FULL"
  }
]

host_naming = [
  {
    enabled = true
    format  = "name_format"
    name    = "host_name"
  }
]

host_process_group_monitoring = [
  {
    host_id          = "host1"
    monitoring_state = "ACTIVE"
    process_group    = "group1"
  }
]

net_tracers = [
  {
    scope      = "ALL"
    net_tracer = "tracer1"
  }
]

network_traffic = [
  {
    host_id = "host1"
    ip_address = "192.168.1.1"
    interface = "eth0"
    os        = "Linux"
  }
]

os_services = [
  {
    name                      = "service1"
    enabled                   = true
    alert_activation_duration = "5m"
    alerting                  = true
    monitoring                = true
    not_installed_alerting    = true
    scope                     = "ALL"
    status_condition_linux    = "ACTIVE"
    system                    = "Linux"
    condition                = "ACTIVE"
    property                 = "service_status"
    metadata_key             = "service_version"
    metadata_value           = "1.0.0"
  }
]

host_naming_orders = [
  {
    naming_rule_ids = ["rule1"]
  }
]
