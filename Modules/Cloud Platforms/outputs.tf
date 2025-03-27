output "cloud_foundry_id" {
  description = "The ID of the Cloud Foundry resource"
  value       = dynatrace_cloud_foundry.example.id
}

output "k8s_monitoring_id" {
  description = "The ID of the Kubernetes monitoring resource"
  value       = dynatrace_k8s_monitoring.example.id
}

output "kubernetes_id" {
  description = "The ID of the Kubernetes resource"
  value       = dynatrace_kubernetes.example.id
}

output "kubernetes_app_id" {
  description = "The ID of the Kubernetes app resource"
  value       = dynatrace_kubernetes_app.example.id
}

output "kubernetes_enrichment_id" {
  description = "The ID of the Kubernetes enrichment resource"
  value       = dynatrace_kubernetes_enrichment.example.id
}