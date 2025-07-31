output "k8s_connection_id" {
  description = "The ID of the Kubernetes connection"
  value       = dynatrace_automation_workflow_k8s_connections.k8s.id
}

output "k8s_connection_name" {
  description = "The name of the Kubernetes connection"
  value       = dynatrace_automation_workflow_k8s_connections.k8s.name
}

output "k8s_connection_uid" {
  description = "The UID of the Kubernetes connection"
  value       = dynatrace_automation_workflow_k8s_connections.k8s.uid
}

output "k8s_connection_namespace" {
  description = "The namespace used in the Kubernetes connection"
  value       = dynatrace_automation_workflow_k8s_connections.k8s.namespace
}
