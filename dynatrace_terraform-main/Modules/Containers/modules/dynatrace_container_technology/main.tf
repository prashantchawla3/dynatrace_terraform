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
