cloud_foundry = {
  cf1 = {
    enabled           = true
    active_gate_group = "cf-gate-group"
    api_url           = "https://api.cf.example.com"
    label             = "Cloud Foundry Instance"
    login_url         = "https://login.cf.example.com"
    password          = "supersecret"
    username          = "admin"
  }
}

k8s_monitoring = {
  cluster1 = {
    cloud_application_pipeline_enabled = true
    event_processing_active            = true
    filter_events                      = false
    include_all_fdi_events             = true
    open_metrics_builtin_enabled       = true
    open_metrics_pipeline_enabled      = false
    scope                              = "environmentid:my-env-id"
    event_patterns = {
      active  = true
      label   = "Node Events"
      pattern = "involvedObject.kind=Node"
    }
  }
}

kubernetes = {
  cluster1 = {
    enabled                        = true
    cluster_id                     = "my-cluster-id"
    cluster_id_enabled             = true
    label                          = "Production Cluster"
    scope                          = "environmentid:my-env-id"
    active_gate_group              = "k8s-gate-group"
    auth_token                     = "dt0c01.abc123securetoken"
    certificate_check_enabled      = true
    endpoint_url                   = "https://k8s-api.example.com"
    hostname_verification_enabled = true
  }
}

kubernetes_app = {
  app1 = {
    scope                 = "environmentid:my-env-id"
    enable_kubernetes_app = true
  }
}

kubernetes_enrichment = {
  enrich1 = {
    scope = "environmentid:my-env-id"
    rules = {
      type   = "KUBERNETES"
      source = "namespace"
      target = "tag"
    }
  }
}
