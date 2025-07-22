output "cloud_foundry_keys" {
  description = "Keys of the created CloudFoundry resources"
  value       = keys(dynatrace_cloud_foundry.cloud_foundry)
}

output "k8s_monitoring_keys" {
  description = "Keys of the created Kubernetes monitoring resources"
  value       = keys(dynatrace_k8s_monitoring.k8s_monitoring)
}

output "kubernetes_keys" {
  description = "Keys of the created Kubernetes resources"
  value       = keys(dynatrace_kubernetes.kubernetes)
}

output "kubernetes_app_keys" {
  description = "Keys of the created Kubernetes app resources"
  value       = keys(dynatrace_kubernetes_app.kubernetes_app)
}

output "kubernetes_enrichment_keys" {
  description = "Keys of the created Kubernetes enrichment resources"
  value       = keys(dynatrace_kubernetes_enrichment.kubernetes_enrichment)
}
