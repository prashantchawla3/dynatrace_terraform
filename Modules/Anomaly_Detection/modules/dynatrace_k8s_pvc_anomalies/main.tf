resource "dynatrace_k8s_pvc_anomalies" "this" {
  scope = var.k8s_pvc_anomalies.scope

  dynamic "low_disk_space_critical" {
    for_each = var.k8s_pvc_anomalies.low_disk_space_critical != null ? [1] : []
    content {
      enabled = var.k8s_pvc_anomalies.low_disk_space_critical.enabled
      configuration {
        observation_period_in_minutes = var.k8s_pvc_anomalies.low_disk_space_critical.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_pvc_anomalies.low_disk_space_critical.configuration.sample_period_in_minutes
        threshold                     = var.k8s_pvc_anomalies.low_disk_space_critical.configuration.threshold
      }
    }
  }

  dynamic "low_disk_space_critical_percentage" {
    for_each = var.k8s_pvc_anomalies.low_disk_space_critical_percentage != null ? [1] : []
    content {
      enabled = var.k8s_pvc_anomalies.low_disk_space_critical_percentage.enabled
      configuration {
        observation_period_in_minutes = var.k8s_pvc_anomalies.low_disk_space_critical_percentage.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_pvc_anomalies.low_disk_space_critical_percentage.configuration.sample_period_in_minutes
        threshold                     = var.k8s_pvc_anomalies.low_disk_space_critical_percentage.configuration.threshold
      }
    }
  }
}
