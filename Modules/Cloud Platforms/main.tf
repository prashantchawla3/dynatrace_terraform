resource "dynatrace_cloud_foundry" "cloud_foundry" {
  for_each          = var.cloud_foundry
  enabled           = each.value.enabled
  active_gate_group = each.value.active_gate_group
  api_url           = each.value.api_url
  label             = each.value.label
  login_url         = each.value.login_url
  password          = each.value.password
  username          = each.value.username
}

resource "dynatrace_k8s_monitoring" "k8s_monitoring" {
  for_each = var.k8s_monitoring
  cloud_application_pipeline_enabled = each.value.cloud_application_pipeline_enabled
  event_processing_active            = each.value.event_processing_active
  filter_events                      = each.value.filter_events
  include_all_fdi_events             = each.value.include_all_fdi_events
  open_metrics_builtin_enabled       = each.value.open_metrics_builtin_enabled
  open_metrics_pipeline_enabled      = each.value.open_metrics_pipeline_enabled
  scope                              = each.value.scope

  event_patterns {
    for pattern in each.value.event_patterns : {
      active  = pattern.active
      label   = pattern.label
      pattern = pattern.pattern
    }
  }
}

resource "dynatrace_kubernetes" "kubernetes" {
  for_each = var.kubernetes
  enabled                    = each.value.enabled
  cluster_id                 = each.value.cluster_id
  cluster_id_enabled         = each.value.cluster_id_enabled
  label                      = each.value.label
  scope                      = each.value.scope
  active_gate_group          = each.value.active_gate_group
  auth_token                 = each.value.auth_token
  certificate_check_enabled  = each.value.certificate_check_enabled
  endpoint_url               = each.value.endpoint_url
  hostname_verification_enabled = each.value.hostname_verification_enabled
}

resource "dynatrace_kubernetes_app" "kubernetes_app" {
  for_each = var.kubernetes_app
  scope = each.value.scope

  kubernetes_app_options {
    enable_kubernetes_app = each.value.enable_kubernetes_app
  }
}

resource "dynatrace_kubernetes_enrichment" "kubernetes_enrichment" {
  for_each = var.kubernetes_enrichment
  scope = each.value.scope

  rules {
    for rule in each.value.rules : {
      type   = rule.type
      source = rule.source
      target = rule.target
    }
  }
}
