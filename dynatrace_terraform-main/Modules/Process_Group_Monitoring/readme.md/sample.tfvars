cloudapp_workloaddetection = {
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

declarative_groupings = {
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

pg_alertings = {
  alert1 = {
    enabled                    = true
    alerting_mode             = "ON_INSTANCE_COUNT_VIOLATION"
    minimum_instance_threshold = 5
    process_group             = "PROCESS_GROUP-1234567890000000"
  }
}

pg_detections = {
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

pg_detection_flags = {
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

pg_monitorings = {
  monitor1 = {
    monitoring_state = "MONITORING_ON"
    process_group_id = "PROCESS_GROUP-1234567890000000"
  }
}

pg_simple_detections = {
  simple1 = {
    enabled             = false
    group_identifier    = "GroupIdentifierExample"
    instance_identifier = "InstanceIdentifierExample"
    process_type        = "PROCESS_TYPE_GO"
    rule_type           = "prop"
  }
}

pg_namings = {
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

pg_naming_order = [
  "dynatrace_processgroup_naming.first.id",
  "dynatrace_processgroup_naming.second.id"
]
