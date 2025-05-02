cloud_foundry = {
  "cf_example" = {
    enabled           = true
    active_gate_group = "group_1"
    api_url           = "https://api.example.com"
    label             = "example_label"
    login_url         = "https://login.example.com"
    password          = "secretpassword"
    username          = "admin"
  }
}

k8s_monitoring = {
  "k8s_example" = {
    cloud_application_pipeline_enabled = true
    event_processing_active            = true
    filter_events                      = true
    include_all_fdi_events             = true
    open_metrics_builtin_enabled       = true
    open_metrics_pipeline_enabled      = true
    scope                              = "us-west"
    event_patterns = [
      {
        active  = true
        label   = "pattern_1"
        pattern = "pattern_value"
      }
    ]
  }
}

kubernetes = {
  "k8s_example" = {
    enabled                    = true
    cluster_id                 = "cluster-123"
    cluster_id_enabled         = true
    label                      = "example_label"
    scope                      = "us-west"
    active_gate_group          = "group_1"
    auth_token                 = "auth-token-123"
    certificate_check_enabled  = true
    endpoint_url               = "https://example.com"
    hostname_verification_enabled = true
  }
}

kubernetes_app = {
  "k8s_app_example" = {
    scope                    = "us-west"
    enable_kubernetes_app    = true
  }
}

kubernetes_enrichment = {
  "k8s_enrichment_example" = {
    scope = "us-west"
    rules = [
      {
        type   = "type1"
        source = "source1"
        target = "target1"
      },
      {
        type   = "type2"
        source = "source2"
        target = "target2"
      }
    ]
  }
}
