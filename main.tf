module "access_token" {
  source = "./Modules/Access_token"

  activegate_token_config = var.activegate_token_config
  ag_token_config         = var.ag_token_config
  api_token_config        = var.api_token_config
  token_settings_config   = var.token_settings_config
}


module "dynatrace_update" {
  source = "./Modules/Updates"

  auto_update           = var.auto_update
  scope_activegate      = var.scope_activegate
  scope_oneagent        = var.scope_oneagent
  target_version        = var.target_version
  update_mode           = var.update_mode
  name                  = var.name
  enabled               = var.enabled
  recurrence            = var.recurrence
  once_recurrence_start = var.once_recurrence_start
  once_recurrence_end   = var.once_recurrence_end
}

module "vmware_monitoring" {
  source = "./Modules/Virtualization"

  vmware_configs = var.vmware_configs
}



module "process_monitoring" {
  source = "./Modules/Process_monitoring"

  host_group_id                             = var.host_group_id
  aspnetcore                                = var.aspnetcore
  cf_appsmanagerjs                          = var.cf_appsmanagerjs
  container                                 = var.container
  docker_pauseamd64                         = var.docker_pauseamd64
  exe_bbs                                   = var.exe_bbs
  exe_caddy                                 = var.exe_caddy
  exe_schedular                             = var.exe_schedular
  exe_silkdaemon                            = var.exe_silkdaemon
  go_static                                 = var.go_static
  node_nodegyp                              = var.node_nodegyp

  process_availability_enabled              = var.process_availability_enabled
  process_availability_name                 = var.process_availability_name
  process_availability_rule_property        = var.process_availability_rule_property
  process_availability_rule_condition       = var.process_availability_rule_condition
  process_availability_metadata_key         = var.process_availability_metadata_key
  process_availability_metadata_value       = var.process_availability_metadata_value

  process_monitoring_host_group_id          = var.process_monitoring_host_group_id
  process_monitoring_auto_monitoring        = var.process_monitoring_auto_monitoring

  process_monitoring_rule_enabled           = var.process_monitoring_rule_enabled
  process_monitoring_rule_mode              = var.process_monitoring_rule_mode
  process_monitoring_rule_host_group_id     = var.process_monitoring_rule_host_group_id
  process_monitoring_rule_condition_item    = var.process_monitoring_rule_condition_item
  process_monitoring_rule_condition_operator = var.process_monitoring_rule_condition_operator
  process_monitoring_rule_condition_value   = var.process_monitoring_rule_condition_value

  process_visibility_enabled                = var.process_visibility_enabled
  process_visibility_max_processes          = var.process_visibility_max_processes
  process_visibility_scope                  = var.process_visibility_scope
}

module "team_management" {
  source = "./Modules/Ownership"

  team_name                    = var.team_name
  team_description             = var.team_description
  team_identifier              = var.team_identifier
  team_external_id             = var.team_external_id

  responsibility_development   = var.responsibility_development
  responsibility_infrastructure = var.responsibility_infrastructure
  responsibility_line_of_business = var.responsibility_line_of_business
  responsibility_operations    = var.responsibility_operations
  responsibility_security      = var.responsibility_security

  additional_info_key          = var.additional_info_key
  additional_info_value        = var.additional_info_value
  additional_info_url          = var.additional_info_url

  contact_integration_type     = var.contact_integration_type
  contact_jira_default_assignee = var.contact_jira_default_assignee
  contact_jira_project         = var.contact_jira_project
  contact_ms_teams             = var.contact_ms_teams
  contact_slack_channel        = var.contact_slack_channel
  contact_url                  = var.contact_url

  link_type                    = var.link_type
  link_url                     = var.link_url

  supplementary_identifier     = var.supplementary_identifier
}


module "rum_configuration" {
  source = "./Modules/Real_User_Monitoring"

  geolocation               = var.geolocation
  process_group_rum         = var.process_group_rum
  rum_advanced_correlation  = var.rum_advanced_correlation
  rum_host_headers          = var.rum_host_headers
  rum_ip_determination      = var.rum_ip_determination
  rum_ip_locations          = var.rum_ip_locations
  rum_overload_prevention   = var.rum_overload_prevention
  rum_provider_breakdown    = var.rum_provider_breakdown
  usability_analytics       = var.usability_analytics
  user_action_metrics       = var.user_action_metrics
  user_experience_score     = var.user_experience_score
  user_session_metrics      = var.user_session_metrics
}

module "custom_device" {
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


module "metrics_configuration" {
  source = "./Modules/Metrics"

  custom_units_name                             = var.custom_units_name
  custom_units_description                      = var.custom_units_description
  custom_units_plural_name                      = var.custom_units_plural_name
  custom_units_symbol                           = var.custom_units_symbol

  histogram_metrics_enable_histogram_bucket_ingest = var.histogram_metrics_enable_histogram_bucket_ingest

  metric_metadata_display_name                  = var.metric_metadata_display_name
  metric_metadata_metric_id                     = var.metric_metadata_metric_id
  metric_metadata_unit                          = var.metric_metadata_unit

  metric_query_metric_id                        = var.metric_query_metric_id
  metric_query_metric_selector                  = var.metric_query_metric_selector
}


module "dynatrace_segment" {
  source = "./Modules/Grail"

  segment_name        = var.segment_name
  segment_description = var.segment_description
  segment_is_public   = var.segment_is_public
  segment_query       = var.segment_query
  includes_items      = var.includes_items
}


module "management_zone" {
  source = "./modules/Management_Zone"

  zone_name        = var.zone_name
  zone_description = var.zone_description
  zone_legacy_id   = var.zone_legacy_id
  entity_selector  = var.entity_selector
}
