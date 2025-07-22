output "vmware_anomalies_ids" {
  description = "IDs of the created VMware anomaly resources"
  value       = [for k, v in dynatrace_vmware_anomalies.vmware : v.id]
}
