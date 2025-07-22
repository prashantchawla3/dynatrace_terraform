output "network_monitor_outage_thresholds" {
  value = { for k, v in dynatrace_network_monitor_outage.this : k => {
    global = v.global_consecutive_outage_count_threshold
    local  = v.local_consecutive_outage_count_threshold
  }}
}