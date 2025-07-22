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
