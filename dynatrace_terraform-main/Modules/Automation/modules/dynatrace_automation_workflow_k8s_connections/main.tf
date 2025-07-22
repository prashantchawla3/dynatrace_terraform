resource "dynatrace_automation_workflow_k8s_connections" "k8s" {
  name      = var.k8s.name
  uid       = var.k8s.uid
  namespace = var.k8s.namespace
  token     = var.k8s.token
}