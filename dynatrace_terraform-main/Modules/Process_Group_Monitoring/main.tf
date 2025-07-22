module "dynatrace_cloudapp_workloaddetection" {
  source = "./Modules/dynatrace_cloudapp_workloaddetection"

  cloudapp_workloaddetection = var.cloudapp_workloaddetection
}

module "dynatrace_declarative_grouping" {
  source = "./Modules/dynatrace_declarative_grouping"

  declarative_groupings = var.declarative_groupings
}

module "dynatrace_pg_alerting" {
  source = "./Modules/dynatrace_pg_alerting"

  pg_alertings = var.pg_alertings
}

module "dynatrace_process_group_detection" {
  source = "./Modules/dynatrace_process_group_detection"

  pg_detections = var.pg_detections
}

module "dynatrace_process_group_detection_flags" {
  source = "./Modules/dynatrace_process_group_detection_flags"

  pg_detection_flags = var.pg_detection_flags
}

module "dynatrace_process_group_monitoring" {
  source = "./Modules/dynatrace_process_group_monitoring"

  pg_monitorings = var.pg_monitorings
}

module "dynatrace_process_group_simple_detection" {
  source = "./Modules/dynatrace_process_group_simple_detection"

  pg_simple_detections = var.pg_simple_detections
}

module "dynatrace_processgroup_naming" {
  source = "./Modules/dynatrace_processgroup_naming"

  pg_namings = var.pg_namings
}

module "dynatrace_processgroup_naming_order" {
  source = "./Modules/dynatrace_processgroup_naming_order"

  pg_naming_order = var.pg_naming_order
}
