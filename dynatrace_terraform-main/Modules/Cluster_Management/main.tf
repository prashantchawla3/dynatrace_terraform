module "dynatrace_environment" {
  source = "./modules/dynatrace_environment"

  environment_name        = var.environment_name
  environment_state       = var.environment_state
  environment_trial       = var.environment_trial
  environment_tags        = var.environment_tags

  storage_transactions    = var.storage_transactions
  storage_user_actions    = var.storage_user_actions
  storage_limits          = var.storage_limits
  storage_retention       = var.storage_retention
  quotas                  = var.quotas
}

module "dynatrace_managed_backup" {
  source = "./modules/dynatrace_managed_backup"

  enabled                    = var.backup_enabled
  datacenter                 = var.backup_datacenter
  include_rum_data           = var.backup_include_rum_data
  include_lm20_data          = var.backup_include_lm20_data
  include_ts_metric_data     = var.backup_include_ts_metric_data
  bandwidth_limit_mbits      = var.backup_bandwidth_limit_mbits
  max_es_snapshots_to_clean  = var.backup_max_es_snapshots_to_clean
  cassandra_scheduled_time   = var.backup_cassandra_scheduled_time
  pause_backups              = var.backup_pause_backups
}

module "dynatrace_managed_internet_proxy" {
  source = "./modules/dynatrace_managed_internet_proxy"

  scheme           = var.proxy_scheme
  server           = var.proxy_server
  port             = var.proxy_port
  user             = var.proxy_user
  password         = var.proxy_password
  non_proxy_hosts  = var.proxy_non_proxy_hosts
}

module "dynatrace_managed_network_zones" {
  source = "./modules/dynatrace_managed_network_zones"

  name              = var.network_zone_name
  description       = var.network_zone_description
  alternative_zones = var.network_zone_alternative_zones
  fallback_mode     = var.network_zone_fallback_mode
}

module "dynatrace_managed_preferences" {
  source = "./modules/dynatrace_managed_preferences"

  ruxit_monitors_ruxit               = var.ruxit_monitors_ruxit
  support_send_billing               = var.support_send_billing
  support_send_cluster_health        = var.support_send_cluster_health
  suppress_non_billing_relevant_data = var.suppress_non_billing_relevant_data
  certificate_management_enabled     = var.certificate_management_enabled
  certificate_management_possible    = var.certificate_management_possible
  community_create_user              = var.community_create_user
  community_external_search          = var.community_external_search
  help_chat_enabled                  = var.help_chat_enabled
  read_only_remote_access_allowed    = var.read_only_remote_access_allowed
  remote_access_on_demand_only       = var.remote_access_on_demand_only
  support_allow_remote_access        = var.support_allow_remote_access
  support_send_events                = var.support_send_events
  telemetry_sharing                  = var.telemetry_sharing
}

module "dynatrace_managed_public_endpoints" {
  source = "./modules/dynatrace_managed_public_endpoints"

  web_ui_address               = var.public_endpoints_web_ui_address
  additional_web_ui_addresses = var.public_endpoints_additional_web_ui_addresses
  beacon_forwarder_address    = var.public_endpoints_beacon_forwarder_address
  cdn_address                 = var.public_endpoints_cdn_address
}

module "dynatrace_managed_remote_access" {
  source = "./modules/dynatrace_managed_remote_access"

  user_id        = var.remote_access_user_id
  reason         = var.remote_access_reason
  requested_days = var.remote_access_requested_days
  role           = var.remote_access_role
}

module "dynatrace_managed_smtp" {
  source = "./modules/dynatrace_managed_smtp"

  host_name                          = var.smtp_host_name
  port                               = var.smtp_port
  user_name                          = var.smtp_user_name
  password                           = var.smtp_password
  is_password_configured             = var.smtp_is_password_configured
  connection_security                = var.smtp_connection_security
  sender_email_address               = var.smtp_sender_email_address
  allow_fallback_via_mission_control = var.smtp_allow_fallback_via_mission_control
  use_smtp_server                    = var.smtp_use_smtp_server
}
