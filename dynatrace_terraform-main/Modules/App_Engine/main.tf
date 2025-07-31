module "discovery_default_rules" {
  source                    = "./modules/dynatrace_discovery_default_rules"
  resource_count            = var.discovery_rule_count
  resource_names            = var.discovery_rule_names
  description               = var.discovery_rule_description
  category                  = var.discovery_rule_category
  environment_scope         = var.discovery_rule_environment_scope
  priority                  = var.discovery_rule_priority
  query                     = var.discovery_rule_query
  title                     = var.discovery_rule_title
  action_name               = var.discovery_rule_action_name
  mode                      = var.discovery_rule_mode
  muted                     = var.discovery_rule_muted
}

module "discovery_feature_flags" {
  source         = "./modules/dynatrace_discovery_feature_flags"
  resource_count = var.feature_flag_count
  resource_names = var.feature_flag_names
  type           = var.feature_flag_type
  boolean_value  = var.feature_flag_boolean_value
}

module "ansible_connections" {
  source         = "./modules/dynatrace_event_driven_ansible_connection"
  resource_count = var.ansible_connection_count
  resource_names = var.ansible_connection_names
  url            = var.ansible_connection_url
  type           = var.ansible_connection_type
  token          = var.ansible_connection_token
}

module "infraops_app_settings" {
  source                         = "./modules/dynatrace_infraops_app_settings"
  resource_count                 = var.infraops_settings_count
  show_monitoring_candidates     = var.infraops_show_monitoring_candidates
  show_standalone_hosts          = var.infraops_show_standalone_hosts
  interface_saturation_threshold = var.infraops_interface_saturation_threshold
}

module "automation_controller_connections" {
  source         = "./modules/dynatrace_automation_controller_connections"
  resource_count = var.automation_controller_count
  resource_names = var.automation_controller_names
  url            = var.automation_controller_url
  type           = var.automation_controller_type
  token          = var.automation_controller_token
}

module "db_app_feature_flags" {
  source         = "./modules/dynatrace_db_app_feature_flags"
  resource_count = var.db_app_feature_flag_count
  resource_names = var.db_app_feature_flag_names
  type           = var.db_app_feature_flag_type
}
