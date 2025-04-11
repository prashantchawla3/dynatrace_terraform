module "Management_Zone" {
  source           = "./Modules/Management_Zone"
  zone_name        = var.zone_name
  zone_description = var.zone_description
  zone_legacy_id   = var.zone_legacy_id
  entity_selector  = var.entity_selector
}

module "Alerting" {
  source                           = "./Modules/Alerting"
  alerting_name                    = var.alerting_name
  alerting_management_zone         = module.Management_Zone.management_zone_id # Reference the management zone created
  alerting_rule_1_tags             = var.alerting_rule_1_tags
  alerting_rule_1_delay_in_minutes = var.alerting_rule_1_delay_in_minutes
  alerting_rule_1_severity_level   = var.alerting_rule_1_severity_level
  alerting_rule_2_tags             = var.alerting_rule_2_tags
  alerting_rule_2_delay_in_minutes = var.alerting_rule_2_delay_in_minutes
  alerting_rule_2_severity_level   = var.alerting_rule_2_severity_level
  alerting_rule_3_tags             = var.alerting_rule_3_tags
  alerting_rule_3_delay_in_minutes = var.alerting_rule_3_delay_in_minutes
  alerting_rule_3_severity_level   = var.alerting_rule_3_severity_level
  alerting_rule_4_tags             = var.alerting_rule_4_tags
  alerting_rule_4_delay_in_minutes = var.alerting_rule_4_delay_in_minutes
  alerting_rule_4_severity_level   = var.alerting_rule_4_severity_level
  alerting_rule_5_tags             = var.alerting_rule_5_tags
  alerting_rule_5_delay_in_minutes = var.alerting_rule_5_delay_in_minutes
  alerting_rule_5_severity_level   = var.alerting_rule_5_severity_level
  alerting_rule_6_tags             = var.alerting_rule_6_tags
  alerting_rule_6_delay_in_minutes = var.alerting_rule_6_delay_in_minutes
  alerting_rule_6_severity_level   = var.alerting_rule_6_severity_level
  connectivity_alerts              = var.connectivity_alerts
  process_group_id                 = var.process_group_id
  maintenance_name                 = var.maintenance_name
  maintenance_description          = var.maintenance_description
  maintenance_type                 = var.maintenance_type
  maintenance_disable_synthetic    = var.maintenance_disable_synthetic
  maintenance_suppression          = var.maintenance_suppression
  maintenance_schedule_type        = var.maintenance_schedule_type
  maintenance_weekly_day_of_week   = var.maintenance_weekly_day_of_week
  maintenance_weekly_end_date      = var.maintenance_weekly_end_date
  maintenance_weekly_start_date    = var.maintenance_weekly_start_date
  maintenance_weekly_end_time      = var.maintenance_weekly_end_time
  maintenance_weekly_start_time    = var.maintenance_weekly_start_time
  maintenance_weekly_time_zone     = var.maintenance_weekly_time_zone
  maintenance_filter_entity_type   = var.maintenance_filter_entity_type
  maintenance_filter_entity_tags   = var.maintenance_filter_entity_tags
}

module "Dashboards" {
  source           = "./Modules/Dashboards"
  dashboard_name   = var.dashboard_name
  dashboard_shared = var.dashboard_shared
  dashboard_owner  = var.dashboard_owner
  dashboard_tags   = var.dashboard_tags
  dashboard_preset = var.dashboard_preset
  metric_name      = var.metric_name
}

module "Tags" {
  source          = "./Modules/Tags"
  autotag_name    = var.autotag_name
  entity_selector = var.entity_selector # Add the required argument

}

module "Topology_Model" {
  source                                      = "./Modules/Topology_Model"
  generic_relationships_enabled               = var.generic_relationships_enabled
  generic_relationships_created_by            = var.generic_relationships_created_by
  generic_relationships_from_role             = var.generic_relationships_from_role
  generic_relationships_from_type             = var.generic_relationships_from_type
  generic_relationships_to_role               = var.generic_relationships_to_role
  generic_relationships_to_type               = var.generic_relationships_to_type
  generic_relationships_type_of_relation      = var.generic_relationships_type_of_relation
  generic_relationships_sources_condition     = var.generic_relationships_sources_condition
  generic_relationships_sources_source_type   = var.generic_relationships_sources_source_type
  generic_types_name                          = var.generic_types_name
  generic_types_enabled                       = var.generic_types_enabled
  generic_types_created_by                    = var.generic_types_created_by
  generic_types_display_name                  = var.generic_types_display_name
  generic_types_rules_icon_pattern            = var.generic_types_rules_icon_pattern
  generic_types_rules_id_pattern              = var.generic_types_rules_id_pattern
  generic_types_rules_instance_name_pattern   = var.generic_types_rules_instance_name_pattern
  generic_types_rules_attributes_key          = var.generic_types_rules_attributes_key
  generic_types_rules_attributes_pattern      = var.generic_types_rules_attributes_pattern
  generic_types_rules_required_dimensions_key = var.generic_types_rules_required_dimensions_key
  generic_types_rules_sources_condition       = var.generic_types_rules_sources_condition
  generic_types_rules_sources_source_type     = var.generic_types_rules_sources_source_type
  grail_security_context_entity_type          = var.grail_security_context_entity_type
  grail_security_context_destination_property = var.grail_security_context_destination_property
}

module "Updates" {
  source                = "./Modules/Updates"
  auto_update           = var.auto_update
  scope_activegate      = var.scope_activegate
  scope_oneagent        = var.scope_oneagent
  target_version        = var.target_version
  update_mode           = var.update_mode
  name                  = var.name
  enabled               = var.enabled
  recurrence            = var.recurrence
  once_recurrence_end   = var.once_recurrence_end
  once_recurrence_start = var.once_recurrence_start
}


module "Service_level_Objective" {
  source                          = "./Modules/Service_level_Objective"
  slo_name                        = var.slo_name
  slo_enabled                     = var.slo_enabled
  slo_description                 = var.slo_description
  slo_evaluation_type             = var.slo_evaluation_type
  slo_evaluation_window           = var.slo_evaluation_window
  slo_filter                      = var.slo_filter
  slo_metric_expression           = var.slo_metric_expression
  slo_metric_name                 = var.slo_metric_name
  slo_target_success              = var.slo_target_success
  slo_target_warning              = var.slo_target_warning
  slo_legacy_id                   = var.slo_legacy_id
  burn_rate_visualization_enabled = var.burn_rate_visualization_enabled
  fast_burn_threshold             = var.fast_burn_threshold
}


module "Service_settings" {
  source                          = "./Modules/Service_settings"
  enable_copilot                  = var.enable_copilot
  enable_tenant_aware_data_mining = var.enable_tenant_aware_data_mining
  blocklist_name                  = var.blocklist_name
  blocklist_type                  = var.blocklist_type
}


module "Metrics" {
  source                                           = "./Modules/Metrics"
  custom_units_name                                = var.custom_units_name
  custom_units_description                         = var.custom_units_description
  custom_units_plural_name                         = var.custom_units_plural_name
  custom_units_symbol                              = var.custom_units_symbol
  histogram_metrics_enable_histogram_bucket_ingest = var.histogram_metrics_enable_histogram_bucket_ingest
  metric_metadata_display_name                     = var.metric_metadata_display_name
  metric_metadata_metric_id                        = var.metric_metadata_metric_id
  metric_metadata_unit                             = var.metric_metadata_unit
  metric_query_metric_id                           = var.metric_query_metric_id
  metric_query_metric_selector                     = var.metric_query_metric_selector
}


module "Process_monitoring" {
  source                                     = "./Modules/Process_monitoring"
  host_group_id                              = var.host_group_id
  aspnetcore                                 = var.aspnetcore
  cf_appsmanagerjs                           = var.cf_appsmanagerjs
  container                                  = var.container
  docker_pauseamd64                          = var.docker_pauseamd64
  exe_bbs                                    = var.exe_bbs
  exe_caddy                                  = var.exe_caddy
  exe_schedular                              = var.exe_schedular
  exe_silkdaemon                             = var.exe_silkdaemon
  go_static                                  = var.go_static
  node_nodegyp                               = var.node_nodegyp
  process_availability_enabled               = var.process_availability_enabled
  process_availability_name                  = var.process_availability_name
  process_availability_rule_property         = var.process_availability_rule_property
  process_availability_rule_condition        = var.process_availability_rule_condition
  process_availability_metadata_key          = var.process_availability_metadata_key
  process_availability_metadata_value        = var.process_availability_metadata_value
  process_monitoring_host_group_id           = var.process_monitoring_host_group_id
  process_monitoring_auto_monitoring         = var.process_monitoring_auto_monitoring
  process_monitoring_rule_enabled            = var.process_monitoring_rule_enabled
  process_monitoring_rule_mode               = var.process_monitoring_rule_mode
  process_monitoring_rule_host_group_id      = var.process_monitoring_rule_host_group_id
  process_monitoring_rule_condition_item     = var.process_monitoring_rule_condition_item
  process_monitoring_rule_condition_operator = var.process_monitoring_rule_condition_operator
  process_monitoring_rule_condition_value    = var.process_monitoring_rule_condition_value
  process_visibility_enabled                 = var.process_visibility_enabled
  process_visibility_max_processes           = var.process_visibility_max_processes
  process_visibility_scope                   = var.process_visibility_scope
}


module "Ownership" {
  source                          = "./Modules/Ownership"
  team_name                       = var.team_name
  team_description                = var.team_description
  team_identifier                 = var.team_identifier
  team_external_id                = var.team_external_id
  responsibility_development      = var.responsibility_development
  responsibility_infrastructure   = var.responsibility_infrastructure
  responsibility_line_of_business = var.responsibility_line_of_business
  responsibility_operations       = var.responsibility_operations
  responsibility_security         = var.responsibility_security
  additional_info_key             = var.additional_info_key
  additional_info_value           = var.additional_info_value
  additional_info_url             = var.additional_info_url
  contact_integration_type        = var.contact_integration_type
  contact_jira_default_assignee   = var.contact_jira_default_assignee
  contact_jira_project            = var.contact_jira_project
  contact_ms_teams                = var.contact_ms_teams
  contact_slack_channel           = var.contact_slack_channel
  contact_url                     = var.contact_url
  link_type                       = var.link_type
  link_url                        = var.link_url
  supplementary_identifier        = var.supplementary_identifier
  #Note: The contact_integration_type is set to 'JIRA' in this example.
  # You can set it to any supported integration type such as 'SLACK' or 'MS_TEAMS' as needed.
  # The other contact methods (MS Teams, Slack, URL) are included as supplementary contact details.
}

module "virtualization" {
  source         = "./Modules/Virtualization"
  enabled_vmware = var.enabled_vmware
  ipaddress      = var.ipaddress
  label          = var.label
  password       = var.password
  username       = var.username
  filter         = var.filter
}

module "session_replay" {
  source = "./Modules/session_replay"

  application_id                                    = var.application_id
  enable_resource_capturing                         = var.enable_resource_capturing
  resource_capture_url_exclusion_pattern_list       = var.resource_capture_url_exclusion_pattern_list
  enable_opt_in_mode                                = var.enable_opt_in_mode
  url_exclusion_pattern_list                        = var.url_exclusion_pattern_list
  playback_masking_preset                           = var.playback_masking_preset
  recording_masking_preset                          = var.recording_masking_preset
  recording_masking_allow_list_rules_css_expression = var.recording_masking_allow_list_rules_css_expression
  recording_masking_allow_list_rules_target         = var.recording_masking_allow_list_rules_target
}

module "monitored_entities" {
  source = "./Modules/monitored_entities"

  custom_device_id = var.custom_device_id
  display_name     = var.display_name
  config_url       = var.config_url
  dns_names        = var.dns_names
  favicon_url      = var.favicon_url
  group            = var.group
  ip_addresses     = var.ip_addresses
  listen_ports     = var.listen_ports
  props            = var.props
  type             = var.type
  ui_based         = var.ui_based
}

module "log_monitoring" {
  source = "./modules/log_monitoring"

  scope = var.scope
  new_container_log_detector = var.new_container_log_detector
  journald_log_detector = var.journald_log_detector
  enabled_buckets = var.enabled_buckets
  bucket_name = var.bucket_name
  matcher_buckets = var.matcher_buckets
  rule_name_buckets = var.rule_name_buckets
  insert_after_buckets = var.insert_after_buckets
  sidebar_custom_attribute = var.sidebar_custom_attribute
  key_custom_attribute = var.key_custom_attribute
  name_custom_source = var.name_custom_source
  enabled_custom_source = var.enabled_custom_source
  scope_custom_source = var.scope_custom_source
  custom_log_source_type = var.custom_log_source_type
  custom_log_source_path = var.custom_log_source_path
  enrichment_type_custom_source = var.enrichment_type_custom_source
  enrichment_key1_custom_source = var.enrichment_key1_custom_source
  enrichment_value1_custom_source = var.enrichment_value1_custom_source
  enrichment_key2_custom_source = var.enrichment_key2_custom_source
  enrichment_value2_custom_source = var.enrichment_value2_custom_source
  enabled_events = var.enabled_events
  query_events = var.query_events
  summary_events = var.summary_events
  event_description = var.event_description
  event_type = var.event_type
  event_title = var.event_title
  metadata_key = var.metadata_key
  metadata_value = var.metadata_value
  enabled_metrics = var.enabled_metrics
  dimensions_metrics = var.dimensions_metrics
  key_metrics = var.key_metrics
  measure_metrics = var.measure_metrics
  measure_attribute_metrics = var.measure_attribute_metrics
  query_metrics = var.query_metrics
  container_timezone_heuristic_enabled = var.container_timezone_heuristic_enabled
  containers_logs_detection_enabled = var.containers_logs_detection_enabled
  date_search_limit_bytes = var.date_search_limit_bytes
  default_timezone = var.default_timezone
  event_log_query_timeout_sec = var.event_log_query_timeout_sec
  iisdetection_enabled = var.iisdetection_enabled
  log_scanner_linux_nfs_enabled = var.log_scanner_linux_nfs_enabled
  max_lgis_per_entity_count = var.max_lgis_per_entity_count
  min_binary_detection_limit_bytes = var.min_binary_detection_limit_bytes
  monitor_own_logs_enabled = var.monitor_own_logs_enabled
  open_log_files_detection_enabled = var.open_log_files_detection_enabled
  scope_oneagent = var.scope_oneagent
  severity_detection_limit_bytes = var.severity_detection_limit_bytes
  severity_detection_lines_limit = var.severity_detection_lines_limit
  system_logs_detection_enabled = var.system_logs_detection_enabled
  enabled_processing = var.enabled_processing
  query_processing = var.query_processing
  rule_name_processing = var.rule_name_processing
  processor_rule = var.processor_rule
  sample_log_processing = var.sample_log_processing
  insert_after_processing = var.insert_after_processing
  query_security_context = var.query_security_context
  rule_name_security_context = var.rule_name_security_context
  value_source_security_context = var.value_source_security_context
  value_source_field_security_context = var.value_source_field_security_context
  value_security_context = var.value_security_context
  insert_after_security_context = var.insert_after_security_context
  name_sensitive_data_masking = var.name_sensitive_data_masking
  enabled_sensitive_data_masking = var.enabled_sensitive_data_masking
  scope_sensitive_data_masking = var.scope_sensitive_data_masking
  masking_type_sensitive_data_masking = var.masking_type_sensitive_data_masking
  expression_sensitive_data_masking = var.expression_sensitive_data_masking
  replacement_sensitive_data_masking = var.replacement_sensitive_data_masking
  matcher_attribute_sensitive_data_masking = var.matcher_attribute_sensitive_data_masking
  matcher_operator_sensitive_data_masking = var.matcher_operator_sensitive_data_masking
  matcher_values_sensitive_data_masking = var.matcher_values_sensitive_data_masking
  insert_after_sensitive_data_masking = var.insert_after_sensitive_data_masking
  name_storage = var.name_storage
  enabled_storage = var.enabled_storage
  scope_storage = var.scope_storage
  send_to_storage = var.send_to_storage
  matcher_attribute_storage = var.matcher_attribute_storage
  matcher_operator_storage = var.matcher_operator_storage
  matcher_values_storage = var.matcher_values_storage
  insert_after_storage = var.insert_after_storage
  enabled_timestamp = var.enabled_timestamp
  config_item_title_timestamp = var.config_item_title_timestamp
  date_time_pattern_timestamp = var.date_time_pattern_timestamp
  scope_timestamp = var.scope_timestamp
  timezone_timestamp = var.timezone_timestamp
  matcher_attribute_timestamp = var.matcher_attribute_timestamp
  matcher_operator_timestamp = var.matcher_operator_timestamp
  matcher_values_timestamp = var.matcher_values_timestamp
  insert_after_timestamp = var.insert_after_timestamp
}

module "Access_token" {
  source = "./modules/Access_token"

  activegate_token_config = var.activegate_token_config
  ag_token_config = var.ag_token_config
  api_token_config = var.api_token_config
  token_settings_config = var.token_settings_config
}
