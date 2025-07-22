resource "dynatrace_k8s_node_anomalies" "this" {
  scope = var.k8s_node_anomalies.scope

  dynamic "cpu_requests_saturation" {
    for_each = var.k8s_node_anomalies.cpu_requests_saturation != null ? [1] : []
    content {
      enabled = var.k8s_node_anomalies.cpu_requests_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_node_anomalies.cpu_requests_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_node_anomalies.cpu_requests_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_node_anomalies.cpu_requests_saturation.configuration.threshold
      }
    }
  }

  dynamic "memory_requests_saturation" {
    for_each = var.k8s_node_anomalies.memory_requests_saturation != null ? [1] : []
    content {
      enabled = var.k8s_node_anomalies.memory_requests_saturation.enabled
    }
  }

  dynamic "pods_saturation" {
    for_each = var.k8s_node_anomalies.pods_saturation != null ? [1] : []
    content {
      enabled = var.k8s_node_anomalies.pods_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_node_anomalies.pods_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_node_anomalies.pods_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_node_anomalies.pods_saturation.configuration.threshold
      }
    }
  }

  dynamic "readiness_issues" {
    for_each = var.k8s_node_anomalies.readiness_issues != null ? [1] : []
    content {
      enabled = var.k8s_node_anomalies.readiness_issues.enabled
    }
  }

  dynamic "node_problematic_condition" {
    for_each = var.k8s_node_anomalies.node_problematic_condition != null ? [1] : []
    content {
      enabled = var.k8s_node_anomalies.node_problematic_condition.enabled
    }
  }
}
