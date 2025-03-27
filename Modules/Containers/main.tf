resource "dynatrace_container_builtin_rule" "container_rule" {
  ignore_docker_pause_container     = var.ignore_docker_pause_container
  ignore_kubernetes_pause_container = var.ignore_kubernetes_pause_container
  ignore_open_shift_build_pod_name  = var.ignore_open_shift_build_pod_name
  ignore_open_shift_sdn_namespace   = var.ignore_open_shift_sdn_namespace
}

resource "dynatrace_container_registry" "container_registry" {
  container_registry = var.container_registry
}

resource "dynatrace_container_rule" "container_monitoring_rule" {
  enabled  = var.container_rule_enabled
  mode     = var.container_rule_mode
  operator = var.container_rule_operator
  property = var.container_rule_property
  value    = var.container_rule_value
}

resource "dynatrace_container_technology" "container_technology" {
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
