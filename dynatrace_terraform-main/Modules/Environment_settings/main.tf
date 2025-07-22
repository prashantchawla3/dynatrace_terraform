
module "app_monitoring_resources" {
  source                 = "./modules/dynatrace_app_monitoring"
  app_monitoring_resources = var.app_monitoring_resources
}

module "audit_log_resources" {
  source               = "./modules/dynatrace_audit_log"
  audit_log_resources = var.audit_log_resources
}

module "cloud_development_resources" {
  source                     = "./modules/dynatrace_cloud_development_environments"
  cloud_development_resources = var.cloud_development_resources
}

module "data_privacy_resources" {
  source                 = "./modules/dynatrace_data_privacy"
  data_privacy_resources = var.data_privacy_resources
}

module "disk_options_resources" {
  source               = "./modules/dynatrace_disk_options"
  disk_options_resources = var.disk_options_resources
}

module "eula_settings_resources" {
  source                = "./modules/dynatrace_eula_settings"
  eula_settings_resources = var.eula_settings_resources
}

module "hub_permissions_resources" {
  source                = "./modules/dynatrace_hub_permissions"
  hub_permissions_resources = var.hub_permissions_resources
}

module "hub_subscriptions_resources" {
  source                 = "./modules/dynatrace_hub_subscriptions"
  hub_subscriptions_resources = var.hub_subscriptions_resources
}

module "ip_masking_resources" {
  source             = "./modules/dynatrace_ip_address_masking"
  ip_masking_resources = var.ip_masking_resources
}

module "outbound_connection_resources" {
  source                    = "./modules/dynatrace_limit_outbound_connections"
  outbound_connection_resources = var.outbound_connection_resources
}

module "oneagent_default_mode_resources" {
  source                      = "./modules/dynatrace_oneagent_default_mode"
  oneagent_default_mode_resources = var.oneagent_default_mode_resources
}

module "oneagent_features_resources" {
  source                  = "./modules/dynatrace-dynatrace_oneagent_features"
  oneagent_features_resources = var.oneagent_features_resources
}

module "oneagent_side_masking_resources" {
  source                     = "./modules/dynatrace_oneagent_side_masking"
  oneagent_side_masking_resources = var.oneagent_side_masking_resources
}
