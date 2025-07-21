variable "cloudapp_workloaddetection" {
  description = "Configures workload detection settings for cloud applications, including Cloud Foundry, Docker, and Kubernetes. Filters are used to refine Kubernetes-based detection."
  type = map(object({
    cloud_foundry_enabled = bool     # Enable workload detection in Cloud Foundry
    docker_enabled        = bool     # Enable workload detection for Docker
    kubernetes_enabled    = bool     # Enable workload detection for Kubernetes
    kubernetes_filters = list(object({
      enabled         = bool         # Enable this Kubernetes filter
      inc_basepod     = bool         # Include base pod in detection
      inc_container   = bool         # Include container name
      inc_namespace   = bool         # Include namespace info
      inc_product     = bool         # Include product metadata
      inc_stage       = bool         # Include stage metadata
      match_operator  = string       # Matching operator, e.g., EXISTS
    }))
  }))
  default = {
    example = {
      cloud_foundry_enabled = false
      docker_enabled        = true
      kubernetes_enabled    = true
      kubernetes_filters = [
        {
          enabled        = false
          inc_basepod    = false
          inc_container  = true
          inc_namespace  = true
          inc_product    = true
          inc_stage      = true
          match_operator = "EXISTS"
        }
      ]
    }
  }
}

variable "declarative_groupings" {
  description = "Defines declarative process group rules based on metadata and conditions."
  type = map(object({
    enabled             = bool       # Enable this declarative rule
    scope               = string     # Rule scope, e.g., 'environment'
    id                  = string     # Unique identifier for this rule
    process_group_name  = string     # Display name for the process group
    report              = string     # Reporting behavior, e.g., 'always'
    rules = list(object({
      condition = string             # Matching condition
      property  = string             # Metadata property to match
    }))
  }))
  default = {
    sample_group = {
      enabled            = true
      scope              = "environment"
      id                 = "PGIdentifierSample"
      process_group_name = "PGDisplayNameSample"
      report             = "always"
      rules = [
        { condition = "$contains(TFExecutableSample)", property = "executable" },
        { condition = "$contains(TFCommandSample)", property = "commandLine" }
      ]
    }
  }
}

variable "pg_alertings" {
  description = "Alerting rules for process groups based on instance count or other criteria."
  type = map(object({
    enabled                     = bool      # Whether alerting is enabled
    alerting_mode              = string    # Alerting strategy, e.g., 'ON_INSTANCE_COUNT_VIOLATION'
    minimum_instance_threshold = number    # Threshold to trigger the alert
    process_group              = string    # ID of the process group to monitor
  }))
  default = {
    alert1 = {
      enabled                     = true
      alerting_mode              = "ON_INSTANCE_COUNT_VIOLATION"
      minimum_instance_threshold = 5
      process_group              = "PROCESS_GROUP-1234567890000000"
    }
  }
}

variable "pg_detections" {
  description = "Detection rules for identifying process groups based on arguments and metadata."
  type = map(object({
    enabled                  = bool
    group_property           = string
    group_standalone_rule   = bool
    group_remove_ids         = bool
    instance_property        = string
    instance_remove_ids      = bool
    contained_string         = string
    process_property         = string
    restrict_to_process_type = string
  }))
  default = {
    detection1 = {
      enabled                 = true
      group_property          = "COMMAND_LINE_ARGS"
      group_standalone_rule  = false
      group_remove_ids        = true
      instance_property       = "AWS_ECS_FAMILY"
      instance_remove_ids     = true
      contained_string        = "-config"
      process_property        = "COMMAND_LINE_ARGS"
      restrict_to_process_type = "PROCESS_TYPE_APACHE_HTTPD"
    }
  }
}

variable "pg_detection_flags" {
  description = "Low-level detection flags used to fine-tune process group detection behavior."
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
  default = {
    flags1 = {
      scope                                      = "environment"
      add_node_js_script_name                   = false
      auto_detect_cassandra_clusters            = true
      auto_detect_spring_boot                   = true
      auto_detect_tibco_container_edition_engines = false
      auto_detect_tibco_engines                 = false
      auto_detect_web_methods_integration_server = false
      auto_detect_web_sphere_liberty_application = false
      group_ibmmqby_instance_name               = false
      identify_jboss_server_by_system_property  = true
      ignore_unique_identifiers                 = true
      short_lived_processes_monitoring          = true
      split_oracle_database_pg                  = false
      split_oracle_listener_pg                  = false
      use_catalina_base                         = false
      use_docker_container_name                 = false
    }
  }
}

variable "pg_monitorings" {
  description = "Defines monitoring state for process groups (e.g., ON, OFF)."
  type = map(object({
    monitoring_state = string    # MONITORING_ON, MONITORING_OFF, etc.
    process_group_id = string    # Process group to apply the monitoring state to
  }))
  default = {
    monitor1 = {
      monitoring_state = "MONITORING_ON"
      process_group_id = "PROCESS_GROUP-1234567890000000"
    }
  }
}

variable "pg_simple_detections" {
  description = "Simple detection configurations based on group and instance identifiers."
  type = map(object({
    enabled             = bool
    group_identifier    = string
    instance_identifier = string
    process_type        = string
    rule_type           = string
  }))
  default = {
    simple1 = {
      enabled             = false
      group_identifier    = "GroupIdentifierExample"
      instance_identifier = "InstanceIdentifierExample"
      process_type        = "PROCESS_TYPE_GO"
      rule_type           = "prop"
    }
  }
}

variable "pg_namings" {
  description = "Rules for naming process groups based on various conditions and string matches."
  type = map(object({
    enabled  = bool
    format   = string
    conditions = list(object({
      key_type        = string
      key_attribute   = string
      tech_negate     = bool
      tech_operator   = string
      tech_value_type = string
    }))
    string_conditions = list(object({
      attribute      = string
      dynamic_key    = string
      case_sensitive = bool
      negate         = bool
      operator       = string
      value          = string
    }))
  }))
  default = {
    naming1 = {
      enabled = true
      format  = "{ProcessGroup:DetectedName} {ProcessGroup:CommandLineArgs}"
      conditions = [
        {
          key_type        = "STATIC"
          key_attribute   = "PROCESS_GROUP_TECHNOLOGY"
          tech_negate     = false
          tech_operator   = "EQUALS"
          tech_value_type = "ADO_NET"
        }
      ]
      string_conditions = [
        {
          attribute      = "PROCESS_GROUP_PREDEFINED_METADATA"
          dynamic_key    = "COMMAND_LINE_ARGS"
          case_sensitive = true
          negate         = false
          operator       = "CONTAINS"
          value          = "-config"
        }
      ]
    }
  }
}

variable "pg_naming_order" {
  description = "List of process group naming rule resource IDs in order of evaluation priority."
  type        = list(string)
  default     = [
    "dynatrace_processgroup_naming.first.id",
    "dynatrace_processgroup_naming.second.id"
  ]
}
