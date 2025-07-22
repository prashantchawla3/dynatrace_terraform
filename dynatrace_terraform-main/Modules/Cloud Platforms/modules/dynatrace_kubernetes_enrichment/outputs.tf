output "kubernetes_enrichment_keys" {
  description = "Keys of the created Kubernetes enrichment resources"
  value       = keys(dynatrace_kubernetes_enrichment.kubernetes_enrichment)
}