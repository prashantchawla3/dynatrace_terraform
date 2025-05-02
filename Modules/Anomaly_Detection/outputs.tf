# Outputs for Dynatrace disk anomaly detection module

output "disk_anomalies_v2_ids" {
  description = "IDs of created dynatrace_disk_anomalies_v2 resources"
  value       = [for r in values(dynatrace_disk_anomalies_v2.this) : r.id]
}

output "disk_anomaly_rules_ids" {
  description = "IDs of created dynatrace_disk_anomaly_rules resources"
  value       = [for r in values(dynatrace_disk_anomaly_rules.this) : r.id]
}

output "disk_edge_anomaly_detectors_ids" {
  description = "IDs of created dynatrace_disk_edge_anomaly_detectors resources"
  value       = [for r in values(dynatrace_disk_edge_anomaly_detectors.this) : r.id]
}

output "disk_specific_anomalies_v2_ids" {
  description = "IDs of created dynatrace_disk_specific_anomalies_v2 resources"
  value       = [for r in values(dynatrace_disk_specific_anomalies_v2.this) : r.id]
}
