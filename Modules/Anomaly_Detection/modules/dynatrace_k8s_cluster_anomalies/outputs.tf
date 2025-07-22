output "k8s_cluster_anomalies_scope" {
  description = "Scope of the Kubernetes cluster anomalies configuration"
  value       = dynatrace_k8s_cluster_anomalies.this.scope
}
