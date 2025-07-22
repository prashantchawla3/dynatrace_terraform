output "k8s_workload_anomalies_scope" {
  description = "Scope of the Kubernetes workload anomalies configuration"
  value       = dynatrace_k8s_workload_anomalies.this.scope
}

output "k8s_workload_anomalies_id" {
  description = "ID of the Kubernetes workload anomalies resource"
  value       = dynatrace_k8s_workload_anomalies.this.id
}
