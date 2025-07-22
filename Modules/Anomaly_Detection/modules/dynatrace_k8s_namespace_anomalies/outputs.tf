output "k8s_namespace_anomalies_scope" {
  description = "Scope of the Kubernetes namespace anomalies configuration"
  value       = dynatrace_k8s_namespace_anomalies.this.scope
}
