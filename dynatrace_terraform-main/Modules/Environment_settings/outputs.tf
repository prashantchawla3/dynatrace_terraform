output "app_monitoring_levels" {
  value = [
    for r in var.app_monitoring_resources : {
      log_level   = r.settings.app_monitoring.default_log_level
      trace_level = r.settings.app_monitoring.default_trace_level
    }
  ]
}

output "audit_log_enabled" {
  value = [
    for r in var.audit_log_resources : r.settings.audit_log.enabled
  ]
}

output "cloud_development_urls" {
  value = [
    for r in var.cloud_development_resources : r.settings.cloud_development_environments
  ]
}

output "data_privacy_settings" {
  value = [
    for r in var.data_privacy_resources : {
      application_id              = r.settings.data_privacy.application_id
      opt_in_mode_enabled         = r.settings.data_privacy.data_collection.opt_in_mode_enabled
      comply_with_do_not_track    = r.settings.data_privacy.do_not_track.comply_with_do_not_track
      uri_masking_enabled         = r.settings.data_privacy.masking.personal_data_uri_masking_enabled
      user_action_masking_enabled = r.settings.data_privacy.masking.user_action_masking_enabled
      persistent_cookie_enabled   = r.settings.data_privacy.user_tracking.persistent_cookie_enabled
    }
  ]
}

output "disk_monitoring_exclusions" {
  value = [
    for r in var.disk_options_resources : r.settings.disk_options.exclusions
  ]
}

output "eula_settings" {
  value = [
    for r in var.eula_settings_resources : {
      scope       = r.settings.eula_settings.scope
      enable_eula = r.settings.eula_settings.enable_eula
    }
  ]
}

output "hub_permissions_info" {
  value = [
    for r in var.hub_permissions_resources : {
      email       = r.settings.hub_permissions.email
      description = r.settings.hub_permissions.description
    }
  ]
}

output "hub_subscription_tokens" {
  value = [
    for r in var.hub_subscriptions_resources : {
      name        = r.settings.hub_subscriptions.token_subscription.name
      description = r.settings.hub_subscriptions.token_subscription.description
      enabled     = r.settings.hub_subscriptions.token_subscription.enabled
      token       = r.settings.hub_subscriptions.token_subscription.token
    }
  ]
}

output "ip_masking_config" {
  value = [
    for r in var.ip_masking_resources : {
      scope   = r.settings.ip_address_masking.scope
      enabled = r.settings.ip_address_masking.enabled
      type    = r.settings.ip_address_masking.type
    }
  ]
}

output "outbound_connection_settings" {
  value = [
    for r in var.outbound_connection_resources : {
      enforced  = r.settings.limit_outbound_connections.allowed_outbound_connections.enforced
      host_list = r.settings.limit_outbound_connections.allowed_outbound_connections.host_list
    }
  ]
}

output "oneagent_default_modes" {
  value = [
    for r in var.oneagent_default_mode_resources : r.settings.oneagent_default_mode.default_mode
  ]
}

output "oneagent_features_config" {
  value = [
    for r in var.oneagent_features_resources : {
      enabled        = r.settings.oneagent_features.enabled
      instrumentation = r.settings.oneagent_features.instrumentation
      key            = r.settings.oneagent_features.key
      scope          = r.settings.oneagent_features.scope
    }
  ]
}

output "oneagent_side_masking_flags" {
  value = [
    for r in var.oneagent_side_masking_resources : {
      email_masking     = r.settings.oneagent_side_masking.is_email_masking_enabled
      financial_masking = r.settings.oneagent_side_masking.is_financial_masking_enabled
      numbers_masking   = r.settings.oneagent_side_masking.is_numbers_masking_enabled
      query_masking     = r.settings.oneagent_side_masking.is_query_masking_enabled
    }
  ]
}
