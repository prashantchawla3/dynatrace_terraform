resource "dynatrace_cloud_foundry" "example" {
  enabled           = var.enabled
  active_gate_group = var.active_gate_group
  api_url           = var.api_url
  label             = var.label
  login_url         = var.login_url
  password          = var.password
  username          = var.username
}

resource "dynatrace_k8s_monitoring" "example" {
  cloud_application_pipeline_enabled = var.cloud_application_pipeline_enabled
  event_processing_active            = var.event_processing_active
  filter_events                      = var.filter_events
  include_all_fdi_events             = var.include_all_fdi_events
  open_metrics_builtin_enabled       = var.open_metrics_builtin_enabled
  open_metrics_pipeline_enabled      = var.open_metrics_pipeline_enabled
  scope                              = var.scope

  event_patterns {
    event_pattern {
      active  = var.event_pattern_active
      label   = var.event_pattern_label
      pattern = var.event_pattern_pattern
    }
  }
}

resource "dynatrace_kubernetes" "example" {
  enabled                    = var.enabled
  cluster_id                 = var.cluster_id
  cluster_id_enabled         = var.cluster_id_enabled
  label                      = var.label
  scope                      = var.scope
  active_gate_group          = var.active_gate_group
  auth_token                 = var.auth_token
  certificate_check_enabled  = var.certificate_check_enabled
  endpoint_url               = var.endpoint_url
  hostname_verification_enabled = var.hostname_verification_enabled
}

resource "dynatrace_kubernetes_app" "example" {
  scope = var.scope

  kubernetes_app_options {
    enable_kubernetes_app = var.enable_kubernetes_app
  }
}

resource "dynatrace_kubernetes_enrichment" "example" {
  scope = var.scope

  rules {
    rule {
      type   = var.rule_type_1
      source = var.rule_source_1
      target = var.rule_target_1
    }
    rule {
      type   = var.rule_type_2
      source = var.rule_source_2
      target = var.rule_target_2
    }
  }
}
