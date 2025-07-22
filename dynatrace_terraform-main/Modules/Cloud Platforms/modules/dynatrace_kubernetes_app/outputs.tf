output "kubernetes_app_keys" {
  description = "Keys of the created Kubernetes app resources"
  value       = keys(dynatrace_kubernetes_app.kubernetes_app)
}
