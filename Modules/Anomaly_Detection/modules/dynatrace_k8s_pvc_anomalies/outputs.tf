output "k8s_pvc_anomalies_scope" {
  description = "Scope of the Kubernetes PVC anomalies configuration"
  value       = dynatrace_k8s_pvc_anomalies.this.scope
}

output "k8s_pvc_anomalies_id" {
  description = "ID of the Kubernetes PVC anomalies resource"
  value       = dynatrace_k8s_pvc_anomalies.this.id
}