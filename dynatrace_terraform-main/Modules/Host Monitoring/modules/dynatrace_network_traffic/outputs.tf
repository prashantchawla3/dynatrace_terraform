output "network_traffic_ids" {
  description = "List of network traffic resource IDs created for each host"
  value       = [for nt in dynatrace_network_traffic.example : nt.id]
}

output "network_traffic_host_ids" {
  description = "List of host IDs associated with the network traffic configuration"
  value       = [for nt in dynatrace_network_traffic.example : nt.host_id]
}

output "network_traffic_excluded_ips" {
  description = "List of excluded IP addresses per network traffic resource"
  value       = [for nt in dynatrace_network_traffic.example : nt.exclude_ip[0].ip_address_form.ip_address]
}

output "network_traffic_excluded_interfaces" {
  description = "List of excluded NIC interfaces per resource"
  value       = [for nt in dynatrace_network_traffic.example : nt.exclude_nic[0].nic_form.interface]
}

output "network_traffic_excluded_os" {
  description = "List of operating systems associated with excluded NICs"
  value       = [for nt in dynatrace_network_traffic.example : nt.exclude_nic[0].nic_form.os]
}
