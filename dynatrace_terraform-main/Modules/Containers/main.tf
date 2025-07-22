# Built-in container rules
resource "dynatrace_container_builtin_rule" "this" {
  count = var.builtin_rule_enabled ? 1 : 0

  ignore_docker_pause_container     = var.ignore_docker_pause_container
  ignore_kubernetes_pause_container = var.ignore_kubernetes_pause_container
  ignore_open_shift_build_pod_name  = var.ignore_open_shift_build_pod_name
  ignore_open_shift_sdn_namespace   = var.ignore_open_shift_sdn_namespace
}


resource "dynatrace_container_rule" "this" {
  count    = var.container_rule_enabled ? 1 : 0
  enabled  = var.container_rule_enabled
  mode     = var.container_rule_mode
  operator = var.container_rule_operator
  property = var.container_rule_property
  value    = var.container_rule_value
}

# Container technology
resource "dynatrace_container_technology" "this" {
  count = var.technology_enabled ? 1 : 0

  bosh_process_manager = var.bosh_process_manager
  containerd           = var.containerd
  crio                 = var.crio
  docker               = var.docker
  docker_windows       = var.docker_windows
  garden               = var.garden
  podman               = var.podman
  scope                = var.scope
  winc                 = var.winc
}
