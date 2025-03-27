output "network_monitor_id" {
  value = dynatrace_network_monitor.DNS_Test.id
}

output "network_monitor_outage_id" {
  value = dynatrace_network_monitor_outage.network_monitor_outage.id
}