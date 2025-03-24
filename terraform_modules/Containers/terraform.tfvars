ignore_docker_pause_container = false
ignore_kubernetes_pause_container = true
ignore_open_shift_build_pod_name = false
ignore_open_shift_sdn_namespace = true

container_registry = "private.registry.org"

container_rule_enabled = true
container_rule_mode = "MONITORING_ON"
container_rule_operator = "NOT_CONTAINS"
container_rule_property = "CONTAINER_NAME"
container_rule_value = "Terraform"

bosh_process_manager = true
containerd = true
crio = true
docker = true
docker_windows = true
garden = true
podman = true
scope = "environment"
winc = true
