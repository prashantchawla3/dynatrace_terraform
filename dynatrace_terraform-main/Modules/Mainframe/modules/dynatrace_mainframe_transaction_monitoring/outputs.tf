output "mainframe_monitoring_group_cics_regions" {
  description = "Whether CICS regions are grouped for mainframe monitoring"
  value       = dynatrace_mainframe_transaction_monitoring.mainframe_monitoring.group_cics_regions
}

output "mainframe_monitoring_group_ims_regions" {
  description = "Whether IMS regions are grouped for mainframe monitoring"
  value       = dynatrace_mainframe_transaction_monitoring.mainframe_monitoring.group_ims_regions
}

output "mainframe_monitoring_monitor_all_ctg_protocols" {
  description = "Whether all CTG protocols are monitored"
  value       = dynatrace_mainframe_transaction_monitoring.mainframe_monitoring.monitor_all_ctg_protocols
}

output "mainframe_monitoring_monitor_all_incoming_web_requests" {
  description = "Whether all incoming web requests are monitored"
  value       = dynatrace_mainframe_transaction_monitoring.mainframe_monitoring.monitor_all_incoming_web_requests
}

output "mainframe_monitoring_node_limit" {
  description = "The node limit for mainframe monitoring"
  value       = dynatrace_mainframe_transaction_monitoring.mainframe_monitoring.node_limit
}

output "mainframe_monitoring_zos_cics_transaction_id_detection" {
  description = "Whether z/OS CICS service detection uses transaction ID"
  value       = dynatrace_mainframe_transaction_monitoring.mainframe_monitoring.zos_cics_service_detection_uses_transaction_id
}

output "mainframe_monitoring_zos_ims_transaction_id_detection" {
  description = "Whether z/OS IMS service detection uses transaction ID"
  value       = dynatrace_mainframe_transaction_monitoring.mainframe_monitoring.zos_ims_service_detection_uses_transaction_id
}
