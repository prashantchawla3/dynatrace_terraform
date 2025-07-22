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
