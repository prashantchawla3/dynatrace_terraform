variable "kubernetes" {
  description = "Core configuration for Kubernetes cluster integration"
  type = map(object({
    enabled                        = bool
    cluster_id                     = string
    cluster_id_enabled             = bool
    label                          = string
    scope                          = string
    active_gate_group              = string
    auth_token                     = string
    certificate_check_enabled      = bool
    endpoint_url                   = string
    hostname_verification_enabled = bool
  }))
  default = {
    default_cluster = {
      enabled                        = true
      cluster_id                     = "k8s-cluster-01"
      cluster_id_enabled             = true
      label                          = "Production Cluster"
      scope                          = "cluster-scope"
      active_gate_group              = "k8s-gate-group"
      auth_token                     = "token123"
      certificate_check_enabled      = true
      endpoint_url                   = string
      hostname_verification_enabled = true
    }
  }
}
