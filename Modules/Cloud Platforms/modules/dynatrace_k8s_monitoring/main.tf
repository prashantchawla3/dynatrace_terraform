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
    event_pattern {
      active  = each.value.event_patterns.active
      label   = each.value.event_patterns.label
      pattern = each.value.event_patterns.pattern
    }
  }
}