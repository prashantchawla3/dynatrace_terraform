output "kubernetes_keys" {
  description = "Keys of the created Kubernetes resources"
  value       = keys(dynatrace_kubernetes.kubernetes)
}
