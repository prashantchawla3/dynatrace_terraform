output "cloud_foundry_ids" {
  description = "IDs of the created CloudFoundry resources"
  value       = dynatrace_cloud_foundry.cloud_foundry[*].id
}

output "k8s_monitoring_ids" {
  description = "IDs of the created Kubernetes monitoring resources"
  value       = dynatrace_k8s_monitoring.k8s_monitoring[*].id
}

output "kubernetes_ids" {
  description = "IDs of the created Kubernetes resources"
  value       = dynatrace_kubernetes.kubernetes[*].id
}

output "kubernetes_app_ids" {
  description = "IDs of the created Kubernetes app resources"
  value       = dynatrace_kubernetes_app.kubernetes_app[*].id
}

output "kubernetes_enrichment_ids" {
  description = "IDs of the created Kubernetes enrichment resources"
  value       = dynatrace_kubernetes_enrichment.kubernetes_enrichment[*].id
}
