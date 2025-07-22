resource "dynatrace_process_group_detection_flags" "this" {
  for_each = var.pg_detection_flags

  scope                                      = each.value.scope
  add_node_js_script_name                   = each.value.add_node_js_script_name
  auto_detect_cassandra_clusters            = each.value.auto_detect_cassandra_clusters
  auto_detect_spring_boot                   = each.value.auto_detect_spring_boot
  auto_detect_tibco_container_edition_engines = each.value.auto_detect_tibco_container_edition_engines
  auto_detect_tibco_engines                 = each.value.auto_detect_tibco_engines
  auto_detect_web_methods_integration_server = each.value.auto_detect_web_methods_integration_server
  auto_detect_web_sphere_liberty_application = each.value.auto_detect_web_sphere_liberty_application
  group_ibmmqby_instance_name               = each.value.group_ibmmqby_instance_name
  identify_jboss_server_by_system_property  = each.value.identify_jboss_server_by_system_property
  ignore_unique_identifiers                 = each.value.ignore_unique_identifiers
  short_lived_processes_monitoring          = each.value.short_lived_processes_monitoring
  split_oracle_database_pg                  = each.value.split_oracle_database_pg
  split_oracle_listener_pg                  = each.value.split_oracle_listener_pg
  use_catalina_base                         = each.value.use_catalina_base
  use_docker_container_name                 = each.value.use_docker_container_name
}