network_monitor_name = "DNS Test"
network_monitor_description = "This is an example DNS test"
network_monitor_type = "MULTI_PROTOCOL"
network_monitor_enabled = false
network_monitor_frequency_min = 15
network_monitor_locations = ["SYNTHETIC_LOCATION-39F97465BE7BF644"]

network_monitor_global_consecutive_outage_count_threshold = 1
network_monitor_global_outages = true

network_monitor_performance_thresholds_enabled = true
network_monitor_threshold_aggregation = "AVG"
network_monitor_threshold_dealerting_samples = 5
network_monitor_threshold_samples = 5
network_monitor_threshold_step_index = 0
network_monitor_threshold_value = 100
network_monitor_threshold_violating_samples = 3

network_monitor_step_name = "DNS Test"
network_monitor_step_request_type = "DNS"
network_monitor_step_target_list = ["google.com", "yahoo.com"]
network_monitor_step_properties = {
  DNS_RECORD_TYPES = "A"
  EXECUTION_TIMEOUT = "PT2S"
}

network_monitor_step_constraint_type = "SUCCESS_RATE_PERCENT"
network_monitor_step_constraint_properties = {
  value = "90"
  operator = ">="
}

network_monitor_step_request_constraint_type = "DNS_STATUS_CODE"
network_monitor_step_request_constraint_properties = {
  operator = "="
  statusCode = "0"
}

network_monitor_tag_context = "CONTEXTLESS"
network_monitor_tag_key = "Key1"
network_monitor_tag_source = "USER"
network_monitor_tag_value = "Value1"

network_monitor_outage_global_outages = true
network_monitor_outage_global_consecutive_outage_count_threshold = 5
network_monitor_outage_local_outages = true
network_monitor_outage_local_consecutive_outage_count_threshold = 3
network_monitor_outage_local_location_outage_count_threshold = 1
network_monitor_outage_scope = "MULTIPROTOCOL_MONITOR"

dynatrace_api_url   = "https://yourenv.live.dynatrace.com/api"
dynatrace_api_token = "your-api-token"