resource "dynatrace_managed_preferences" "this" {
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
