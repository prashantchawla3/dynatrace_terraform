# dynatrace_environment
environment_name  = "example-env"
environment_state = "ENABLED"
environment_trial = false
environment_tags  = ["production", "critical"]

storage_transactions = 10000
storage_user_actions = 5000

storage_limits = {
  logs           = 1000000000
  session_replay = 500000000
  symbol_files   = 250000000
  transactions   = 750000000
}

storage_retention = {
  rum                   = 30
  service_code_level    = 180
  service_request_level = 365
  session_replay        = 30
  synthetic             = 30
  logs                  = 60
}

quotas = {
  host_units = 10
  ddus = {
    annual  = 100000
    monthly = 8000
  }
  dem_units = {
    annual  = 50000
    monthly = 4000
  }
  logs = {
    annual  = 20000
    monthly = 1500
  }
  synthetic = {
    annual  = 10000
    monthly = 800
  }
  user_sessions = {
    annual  = 120000
    monthly = 10000
  }
}

# dynatrace_managed_preferences
ruxit_monitors_ruxit               = true
support_send_billing               = true
support_send_cluster_health        = true
suppress_non_billing_relevant_data = false

certificate_management_enabled     = false
certificate_management_possible    = true
community_create_user              = false
community_external_search          = true
help_chat_enabled                  = true
read_only_remote_access_allowed    = true
remote_access_on_demand_only       = false
support_allow_remote_access        = true
support_send_events                = true
telemetry_sharing                  = false

# dynatrace_managed_backup
backup_enabled                    = true
backup_datacenter                = "dc1"
backup_include_rum_data          = true
backup_include_lm20_data         = true
backup_include_ts_metric_data    = true
backup_bandwidth_limit_mbits     = 240
backup_max_es_snapshots_to_clean = 25
backup_cassandra_scheduled_time  = 22
backup_pause_backups             = false



# dynatrace_managed_network_zones
network_zone_name              = "terraform-zone"
network_zone_description       = "Example network zone"
network_zone_alternative_zones = ["zone-a", "zone-b"]
network_zone_fallback_mode     = "ANY_ACTIVE_GATE"

# dynatrace_managed_public_endpoints
public_endpoints_web_ui_address               = "https://webui.example.com"
public_endpoints_additional_web_ui_addresses = ["https://webui1.example.com", "https://webui2.example.com"]
public_endpoints_beacon_forwarder_address     = "https://beacon.example.com:443"
public_endpoints_cdn_address                  = "https://cdn.example.com"

# dynatrace_managed_remote_access
remote_access_user_id        = "admin@example.com"
remote_access_reason         = "Maintenance"
remote_access_requested_days = 2
remote_access_role           = "devops-admin"

