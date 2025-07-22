output "host_anomalies_scope" {
  description = "The scope of the host anomalies configuration"
  value       = dynatrace_host_anomalies_v2.this.scope
}

output "host_anomalies_id" {
  description = "The ID of the host anomalies resource"
  value       = dynatrace_host_anomalies_v2.this.id
}