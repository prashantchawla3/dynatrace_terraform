resource "dynatrace_aix_extension" "example" {
  host_id             = var.host_id
  use_global_settings = var.use_global_settings
  enabled             = var.enabled
}

resource "dynatrace_crashdump_analytics" "example" {
  host_id                     = var.host_id
  enable_crash_dump_analytics = var.enable_crash_dump_analytics
}

resource "dynatrace_disk_analytics" "example" {
  enabled = var.enabled
  scope   = var.scope
}

resource "dynatrace_ebpf_service_discovery" "example" {
  ebpf  = var.ebpf
  scope = var.scope
}

resource "dynatrace_host_monitoring" "example" {
  enabled = var.enabled
  host_id = var.host_id
}

resource "dynatrace_host_monitoring_advanced" "example" {
  host_id                 = var.host_id
  process_agent_injection = var.process_agent_injection
  code_module_injection   = var.code_module_injection
}

resource "dynatrace_host_monitoring_mode" "example" {
  host_id         = var.host_id_mode
  monitoring_mode = var.monitoring_mode
}

resource "dynatrace_host_naming" "example" {
  enabled = var.enabled
  format  = var.format
  name    = var.name
}

resource "dynatrace_host_process_group_monitoring" "example" {
  host_id          = var.host_id
  monitoring_state = var.monitoring_state
  process_group    = var.process_group
}

resource "dynatrace_nettracer" "example" {
  scope      = var.scope
  net_tracer = var.net_tracer
}

resource "dynatrace_network_traffic" "example" {
  host_id = var.host_id
  exclude_ip {
    ip_address_form {
      ip_address = var.ip_address
    }
  }
  exclude_nic {
    nic_form {
      interface = var.interface
      os        = var.os
    }
  }
}

resource "dynatrace_os_services" "example" {
  name                      = var.name
  enabled                   = var.enabled
  alert_activation_duration = var.alert_activation_duration
  alerting                  = var.alerting
  monitoring                = var.monitoring
  not_installed_alerting    = var.not_installed_alerting
  scope                     = var.scope
  status_condition_linux    = var.status_condition_linux
  system                    = var.system
  detection_conditions_linux {
    linux_detection_condition {
      condition = var.condition
      property  = var.property
    }
  }
  metadata {
    item {
      metadata_key   = var.metadata_key
      metadata_value = var.metadata_value
    }
  }
}

resource "dynatrace_host_naming_order" "example" {
  naming_rule_ids = [
    dynatrace_host_naming.example.id,
  ]
}