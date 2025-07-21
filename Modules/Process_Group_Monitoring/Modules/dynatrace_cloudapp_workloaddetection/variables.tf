variable "cloudapp_workloaddetection" {
  description = "Configures workload detection settings for cloud applications, including Cloud Foundry, Docker, and Kubernetes. Filters are used to refine Kubernetes-based detection."
  type = map(object({
    cloud_foundry_enabled = bool     # Enable workload detection in Cloud Foundry
    docker_enabled        = bool     # Enable workload detection for Docker
    kubernetes_enabled    = bool     # Enable workload detection for Kubernetes
    kubernetes_filters = list(object({
      enabled         = bool         # Enable this Kubernetes filter
      inc_basepod     = bool         # Include base pod in detection
      inc_container   = bool         # Include container name
      inc_namespace   = bool         # Include namespace info
      inc_product     = bool         # Include product metadata
      inc_stage       = bool         # Include stage metadata
      match_operator  = string       # Matching operator, e.g., EXISTS
    }))
  }))
  default = {
    example = {
      cloud_foundry_enabled = false
      docker_enabled        = true
      kubernetes_enabled    = true
      kubernetes_filters = [
        {
          enabled        = false
          inc_basepod    = false
          inc_container  = true
          inc_namespace  = true
          inc_product    = true
          inc_stage      = true
          match_operator = "EXISTS"
        }
      ]
    }
  }
}
