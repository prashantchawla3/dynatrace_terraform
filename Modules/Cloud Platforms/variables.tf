variable "cloud_foundry" {
  description = "Configuration for Dynatrace Cloud Foundry"
  type = map(object({
    enabled           = bool
    active_gate_group = string
    api_url           = string
    label             = string
    login_url         = string
    password          = string
    username          = string
  }))
  default = {}
}

variable "k8s_monitoring" {
  description = "Configuration for Kubernetes Monitoring"
  type = map(object({
    cloud_application_pipeline_enabled = bool
    event_processing_active            = bool
    filter_events                      = bool
    include_all_fdi_events             = bool
    open_metrics_builtin_enabled       = bool
    open_metrics_pipeline_enabled      = bool
    scope                              = string
    event_patterns = list(object({
      active  = bool
      label   = string
      pattern = string
    }))
  }))
  default = {}
}

variable "kubernetes" {
  description = "Configuration for Kubernetes"
  type = map(object({
    enabled                    = bool
    cluster_id                 = string
    cluster_id_enabled         = bool
    label                      = string
    scope                      = string
    active_gate_group          = string
    auth_token                 = string
    certificate_check_enabled  = bool
    endpoint_url               = string
    hostname_verification_enabled = bool
  }))
  default = {}
}

variable "kubernetes_app" {
  description = "Configuration for Kubernetes App"
  type = map(object({
    scope                    = string
    enable_kubernetes_app    = bool
  }))
  default = {}
}

variable "kubernetes_enrichment" {
  description = "Configuration for Kubernetes Enrichment"
  type = map(object({
    scope = string
    rules = list(object({
      type   = string
      source = string
      target = string
    }))
  }))
  default = {}
}
