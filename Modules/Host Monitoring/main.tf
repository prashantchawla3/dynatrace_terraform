resource "dynatrace_aix_extension" "example" {
  count               = length(var.aix_extensions)
  host_id             = var.aix_extensions[count.index].host_id
  use_global_settings = var.aix_extensions[count.index].use_global_settings
  enabled             = var.aix_extensions[count.index].enabled
}

resource "dynatrace_crashdump_analytics" "example" {
  count                     = length(var.crashdump_analytics)
  host_id                   = var.crashdump_analytics[count.index].host_id
  enable_crash_dump_analytics = var.crashdump_analytics[count.index].enable_crash_dump_analytics
}

resource "dynatrace_disk_analytics" "example" {
  count   = length(var.disk_analytics)
  enabled = var.disk_analytics[count.index].enabled
  scope   = var.disk_analytics[count.index].scope
}

resource "dynatrace_ebpf_service_discovery" "example" {
  count = length(var.ebpf_service_discovery)
  ebpf  = var.ebpf_service_discovery[count.index].ebpf
  scope = var.ebpf_service_discovery[count.index].scope
}

resource "dynatrace_host_monitoring" "example" {
  count   = length(var.host_monitoring)
  enabled = var.host_monitoring[count.index].enabled
  host_id = var.host_monitoring[count.index].host_id
}

resource "dynatrace_host_monitoring_advanced" "example" {
  count                   = length(var.host_monitoring_advanced)
  host_id                 = var.host_monitoring_advanced[count.index].host_id
  process_agent_injection = var.host_monitoring_advanced[count.index].process_agent_injection
  code_module_injection   = var.host_monitoring_advanced[count.index].code_module_injection
}

resource "dynatrace_host_monitoring_mode" "example" {
  count             = length(var.host_monitoring_modes)
  host_id           = var.host_monitoring_modes[count.index].host_id
  monitoring_mode   = var.host_monitoring_modes[count.index].monitoring_mode
}

resource "dynatrace_host_naming" "example" {
  count   = length(var.host_naming)
  enabled = var.host_naming[count.index].enabled
  format  = var.host_naming[count.index].format
  name    = var.host_naming[count.index].name
}

resource "dynatrace_host_process_group_monitoring" "example" {
  count             = length(var.host_process_group_monitoring)
  host_id           = var.host_process_group_monitoring[count.index].host_id
  monitoring_state  = var.host_process_group_monitoring[count.index].monitoring_state
  process_group     = var.host_process_group_monitoring[count.index].process_group
}

resource "dynatrace_nettracer" "example" {
  count      = length(var.net_tracers)
  scope      = var.net_tracers[count.index].scope
  net_tracer = var.net_tracers[count.index].net_tracer
}

resource "dynatrace_network_traffic" "example" {
  count   = length(var.network_traffic)
  host_id = var.network_traffic[count.index].host_id
  exclude_ip {
    ip_address_form {
      ip_address = var.network_traffic[count.index].ip_address
    }
  }
  exclude_nic {
    nic_form {
      interface = var.network_traffic[count.index].interface
      os        = var.network_traffic[count.index].os
    }
  }
}

resource "dynatrace_os_services" "example" {
  count                     = length(var.os_services)
  name                      = var.os_services[count.index].name
  enabled                   = var.os_services[count.index].enabled
  alert_activation_duration = var.os_services[count.index].alert_activation_duration
  alerting                  = var.os_services[count.index].alerting
  monitoring                = var.os_services[count.index].monitoring
  not_installed_alerting    = var.os_services[count.index].not_installed_alerting
  scope                     = var.os_services[count.index].scope
  status_condition_linux    = var.os_services[count.index].status_condition_linux
  system                    = var.os_services[count.index].system
  detection_conditions_linux {
    linux_detection_condition {
      condition = var.os_services[count.index].condition
      property  = var.os_services[count.index].property
    }
  }
  metadata {
    item {
      metadata_key   = var.os_services[count.index].metadata_key
      metadata_value = var.os_services[count.index].metadata_value
    }
  }
}

resource "dynatrace_host_naming_order" "example" {
  count             = length(var.host_naming_orders)
  naming_rule_ids   = [dynatrace_host_naming.example[count.index].id]
}
