variable "cloudapp_workloaddetection" {
  type = map(object({
    cloud_foundry_enabled = bool
    docker_enabled        = bool
    kubernetes_enabled    = bool
    kubernetes_filters = list(object({
      enabled         = bool
      inc_basepod     = bool
      inc_container   = bool
      inc_namespace   = bool
      inc_product     = bool
      inc_stage       = bool
      match_operator  = string
    }))
  }))
}

variable "declarative_groupings" {
  type = map(object({
    enabled             = bool
    scope               = string
    id                  = string
    process_group_name  = string
    report              = string
    rules = list(object({
      condition = string
      property  = string
    }))
  }))
}

variable "pg_alertings" {
  type = map(object({
    enabled                    = bool
    alerting_mode             = string
    minimum_instance_threshold = number
    process_group             = string
  }))
}

variable "pg_detections" {
  type = map(object({
    enabled                 = bool
    group_property          = string
    group_standalone_rule  = bool
    group_remove_ids        = bool
    instance_property       = string
    instance_remove_ids     = bool
    contained_string        = string
    process_property        = string
    restrict_to_process_type = string
  }))
}

variable "pg_detection_flags" {
  type = map(object({
    scope                                      = string
    add_node_js_script_name                   = bool
    auto_detect_cassandra_clusters            = bool
    auto_detect_spring_boot                   = bool
    auto_detect_tibco_container_edition_engines = bool
    auto_detect_tibco_engines                 = bool
    auto_detect_web_methods_integration_server = bool
    auto_detect_web_sphere_liberty_application = bool
    group_ibmmqby_instance_name               = bool
    identify_jboss_server_by_system_property  = bool
    ignore_unique_identifiers                 = bool
    short_lived_processes_monitoring          = bool
    split_oracle_database_pg                  = bool
    split_oracle_listener_pg                  = bool
    use_catalina_base                         = bool
    use_docker_container_name                 = bool
  }))
}

variable "pg_monitorings" {
  type = map(object({
    monitoring_state = string
    process_group_id = string
  }))
}

variable "pg_simple_detections" {
  type = map(object({
    enabled             = bool
    group_identifier    = string
    instance_identifier = string
    process_type        = string
    rule_type           = string
  }))
}

variable "pg_namings" {
  type = map(object({
    enabled  = bool
    format   = string
    conditions = list(object({
      key_type         = string
      key_attribute    = string
      tech_negate      = bool
      tech_operator    = string
      tech_value_type  = string
    }))
    string_conditions = list(object({
      attribute       = string
      dynamic_key     = string
      case_sensitive  = bool
      negate          = bool
      operator        = string
      value           = string
    }))
  }))
}

variable "pg_naming_order" {
  type = list(string)
}
