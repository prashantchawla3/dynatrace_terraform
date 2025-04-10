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
