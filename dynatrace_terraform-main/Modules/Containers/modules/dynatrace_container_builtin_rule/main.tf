resource "dynatrace_container_builtin_rule" "this" {
  count = var.builtin_rule_enabled ? 1 : 0

  ignore_docker_pause_container     = var.ignore_docker_pause_container
  ignore_kubernetes_pause_container = var.ignore_kubernetes_pause_container
  ignore_open_shift_build_pod_name  = var.ignore_open_shift_build_pod_name
  ignore_open_shift_sdn_namespace   = var.ignore_open_shift_sdn_namespace
}