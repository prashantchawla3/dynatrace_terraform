resource "dynatrace_builtin_process_monitoring" "builtin_process_monitoring" {
  host_group_id       = var.host_group_id
  aspnetcore          = var.aspnetcore
  cf_appsmanagerjs    = var.cf_appsmanagerjs
  container           = var.container
  docker_pauseamd64   = var.docker_pauseamd64
  exe_bbs             = var.exe_bbs
  exe_caddy           = var.exe_caddy
  exe_schedular       = var.exe_schedular
  exe_silkdaemon      = var.exe_silkdaemon
  go_static           = var.go_static
  node_nodegyp        = var.node_nodegyp
}

resource "dynatrace_process_availability" "process_availability" {
  enabled = var.process_availability_enabled
  name    = var.process_availability_name
  rules {
    rule {
      property  = var.process_availability_rule_property
      condition = var.process_availability_rule_condition
    }
  }
  metadata {
    item {
      key   = var.process_availability_metadata_key
      value = var.process_availability_metadata_value
    }
  }
}

resource "dynatrace_process_monitoring" "process_monitoring" {
  host_group_id   = var.process_monitoring_host_group_id
  auto_monitoring = var.process_monitoring_auto_monitoring
}

resource "dynatrace_process_monitoring_rule" "process_monitoring_rule" {
  enabled       = var.process_monitoring_rule_enabled
  mode          = var.process_monitoring_rule_mode
  host_group_id = var.process_monitoring_rule_host_group_id
  condition {
    item     = var.process_monitoring_rule_condition_item
    operator = var.process_monitoring_rule_condition_operator
    value    = var.process_monitoring_rule_condition_value
  }
}

resource "dynatrace_process_visibility" "process_visibility" {
  enabled       = var.process_visibility_enabled
  max_processes = var.process_visibility_max_processes
  scope         = var.process_visibility_scope
}