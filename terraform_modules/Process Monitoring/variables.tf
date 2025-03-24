variable "host_group_id" {
  type = string
}

variable "aspnetcore" {
  type = bool
}

variable "cf_appsmanagerjs" {
  type = bool
}

variable "container" {
  type = bool
}

variable "docker_pauseamd64" {
  type = bool
}

variable "exe_bbs" {
  type = bool
}

variable "exe_caddy" {
  type = bool
}

variable "exe_schedular" {
  type = bool
}

variable "exe_silkdaemon" {
  type = bool
}

variable "go_static" {
  type = bool
}

variable "node_nodegyp" {
  type = bool
}

variable "process_availability_enabled" {
  type = bool
}

variable "process_availability_name" {
  type = string
}

variable "process_availability_rule_property" {
  type = string
}

variable "process_availability_rule_condition" {
  type = string
}

variable "process_availability_metadata_key" {
  type = string
}

variable "process_availability_metadata_value" {
  type = string
}

variable "process_monitoring_host_group_id" {
  type = string
}

variable "process_monitoring_auto_monitoring" {
  type = bool
}

variable "process_monitoring_rule_enabled" {
  type = bool
}

variable "process_monitoring_rule_mode" {
  type = string
}

variable "process_monitoring_rule_host_group_id" {
  type = string
}

variable "process_monitoring_rule_condition_item" {
  type = string
}

variable "process_monitoring_rule_condition_operator" {
  type = string
}

variable "process_monitoring_rule_condition_value" {
  type = string
}

variable "process_visibility_enabled" {
  type = bool
}

variable "process_visibility_max_processes" {
  type = number
}

variable "process_visibility_scope" {
  type = string
}


