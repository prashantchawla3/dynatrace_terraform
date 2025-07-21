output "k8s_monitoring_keys" {
  description = "Keys of the created Kubernetes monitoring resources"
  value       = keys(dynatrace_k8s_monitoring.k8s_monitoring)
}
