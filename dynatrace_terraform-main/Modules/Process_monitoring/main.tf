module "builtin_process_monitoring" {
  source = "./Modules/dynatrace_builtin_process_monitoring"

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

module "process_availability" {
  source = ".//Modules/dynatrace_process_availability"

  process_availability_enabled         = var.process_availability_enabled
  process_availability_name            = var.process_availability_name
  process_availability_rule_property   = var.process_availability_rule_property
  process_availability_rule_condition  = var.process_availability_rule_condition
  process_availability_metadata_key    = var.process_availability_metadata_key
  process_availability_metadata_value  = var.process_availability_metadata_value
}

module "process_monitoring" {
  source = "./Modules/dynatrace_process_monitoring"

  process_monitoring_host_group_id   = var.process_monitoring_host_group_id
  process_monitoring_auto_monitoring = var.process_monitoring_auto_monitoring
}

module "process_monitoring_rule" {
  source = "./Modules/dynatrace_process_monitoring_rule"

  process_monitoring_rule_enabled            = var.process_monitoring_rule_enabled
  process_monitoring_rule_mode               = var.process_monitoring_rule_mode
  process_monitoring_rule_host_group_id      = var.process_monitoring_rule_host_group_id
  process_monitoring_rule_condition_item     = var.process_monitoring_rule_condition_item
  process_monitoring_rule_condition_operator = var.process_monitoring_rule_condition_operator
  process_monitoring_rule_condition_value    = var.process_monitoring_rule_condition_value
}

module "process_visibility" {
  source = "./Modules/dynatrace_process_visibility"

  process_visibility_enabled        = var.process_visibility_enabled
  process_visibility_max_processes = var.process_visibility_max_processes
  process_visibility_scope         = var.process_visibility_scope
}
