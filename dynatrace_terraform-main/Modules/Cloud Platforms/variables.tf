variable "cloud_foundry" {
  description = "Configuration for Dynatrace Cloud Foundry integration"
  type = map(object({
    enabled           = bool
    active_gate_group = string
    api_url           = string
    label             = string
    login_url         = string
    password          = string
    username          = string
  }))
  default = {
    default_cf = {
      enabled           = true
      active_gate_group = "cf-gate-group"
      api_url           = "https://api.cf.example.com"
      label             = "CF Integration"
      login_url         = "https://login.cf.example.com"
      password          = "secret"
      username          = "admin"
    }
  }
}

variable "k8s_monitoring" {
  description = "Configuration options for Kubernetes monitoring with Dynatrace"
  type = map(object({
    cloud_application_pipeline_enabled = bool
    event_processing_active            = bool
    filter_events                      = bool
    include_all_fdi_events             = bool
    open_metrics_builtin_enabled       = bool
    open_metrics_pipeline_enabled      = bool
    scope                              = string
    event_patterns = object({
      active  = bool
      label   = string
      pattern = string
    })
  }))
  default = {
    default_k8s_monitoring = {
      cloud_application_pipeline_enabled = true
      event_processing_active            = true
      filter_events                      = true
      include_all_fdi_events             = false
      open_metrics_builtin_enabled       = true
      open_metrics_pipeline_enabled      = true
      scope                              = "monitoring-scope"
      event_patterns = {
        active  = true
        label   = "K8s Events"
        pattern = ".*"
      }
    }
  }
}

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

variable "kubernetes_app" {
  description = "Kubernetes app-level monitoring configuration"
  type = map(object({
    scope                 = string
    enable_kubernetes_app = bool
  }))
  default = {
    default_app = {
      scope                 = "app-scope"
      enable_kubernetes_app = true
    }
  }
}

variable "kubernetes_enrichment" {
  description = "Kubernetes enrichment configuration using custom rules"
  type = map(object({
    scope = string
    rules = object({
      type   = string
      source = string
      target = string
    })
  }))
  default = {
    enrichment_rule = {
      scope = "enrichment-scope"
      rules = {
        type   = "label"
        source = "namespace"
        target = "environment"
      }
    }
  }
}
