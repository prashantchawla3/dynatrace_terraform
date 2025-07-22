output "k8s_node_anomalies_scope" {
  description = "Scope of the Kubernetes node anomalies configuration"
  value       = dynatrace_k8s_node_anomalies.this.scope
}

output "k8s_node_anomalies_id" {
  description = "ID of the Kubernetes node anomalies resource"
  value       = dynatrace_k8s_node_anomalies.this.id
}
