output "kubernetes_spm_scopes" {
  value = [for k in dynatrace_kubernetes_spm.spm : k.scope]
}