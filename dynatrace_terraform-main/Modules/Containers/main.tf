
module "container_builtin_rule" {
  source = "./modules/dynatrace_container_builtin_rule"

  builtin_rule_enabled              = var.builtin_rule_enabled
  ignore_docker_pause_container     = var.ignore_docker_pause_container
  ignore_kubernetes_pause_container = var.ignore_kubernetes_pause_container
  ignore_open_shift_build_pod_name  = var.ignore_open_shift_build_pod_name
  ignore_open_shift_sdn_namespace   = var.ignore_open_shift_sdn_namespace
}


module "container_rule" {
  source = "./modules/dynatrace_container_rule"

  container_rule_enabled  = var.container_rule_enabled
  container_rule_mode     = var.container_rule_mode
  container_rule_operator = var.container_rule_operator
  container_rule_property = var.container_rule_property
  container_rule_value    = var.container_rule_value
}


module "container_technology" {
  source = "./modules/dynatrace_container_technology"

  technology_enabled    = var.technology_enabled
  bosh_process_manager  = var.bosh_process_manager
  containerd            = var.containerd
  crio                  = var.crio
  docker                = var.docker
  docker_windows        = var.docker_windows
  garden                = var.garden
  podman                = var.podman
  scope                 = var.scope
  winc                  = var.winc
}
