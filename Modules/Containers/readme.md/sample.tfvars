# Built-in rule
builtin_rule_enabled             = true
ignore_docker_pause_container    = true
ignore_kubernetes_pause_container = true
ignore_open_shift_build_pod_name  = false
ignore_open_shift_sdn_namespace   = false

# Container registry
registry_enabled     = true
container_registry   = "docker.io/myregistry"

# Container rule
container_rule_enabled = true
container_rule_mode     = "EXCLUDE"
container_rule_operator = "EQUALS"
container_rule_property = "CONTAINER_NAME"
container_rule_value    = "pause"

# Container technology
technology_enabled     = true
bosh_process_manager   = false
containerd             = true
crio                   = true
docker                 = true
docker_windows         = false
garden                 = false
podman                 = true
scope                  = "environment"
winc                   = false
