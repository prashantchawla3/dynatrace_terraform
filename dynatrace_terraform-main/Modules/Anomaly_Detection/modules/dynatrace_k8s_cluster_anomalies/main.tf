resource "dynatrace_k8s_cluster_anomalies" "this" {
  scope = var.k8s_cluster_anomalies.scope

  dynamic "cpu_requests_saturation" {
    for_each = var.k8s_cluster_anomalies.cpu_requests_saturation != null ? [1] : []
    content {
      enabled = var.k8s_cluster_anomalies.cpu_requests_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_cluster_anomalies.cpu_requests_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_cluster_anomalies.cpu_requests_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_cluster_anomalies.cpu_requests_saturation.configuration.threshold
      }
    }
  }

  dynamic "memory_requests_saturation" {
    for_each = var.k8s_cluster_anomalies.memory_requests_saturation != null ? [1] : []
    content {
      enabled = var.k8s_cluster_anomalies.memory_requests_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_cluster_anomalies.memory_requests_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_cluster_anomalies.memory_requests_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_cluster_anomalies.memory_requests_saturation.configuration.threshold
      }
    }
  }

  dynamic "monitoring_issues" {
    for_each = var.k8s_cluster_anomalies.monitoring_issues != null ? [1] : []
    content {
      enabled = var.k8s_cluster_anomalies.monitoring_issues.enabled
      configuration {
        observation_period_in_minutes = var.k8s_cluster_anomalies.monitoring_issues.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_cluster_anomalies.monitoring_issues.configuration.sample_period_in_minutes
      }
    }
  }

  dynamic "pods_saturation" {
    for_each = var.k8s_cluster_anomalies.pods_saturation != null ? [1] : []
    content {
      enabled = var.k8s_cluster_anomalies.pods_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_cluster_anomalies.pods_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_cluster_anomalies.pods_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_cluster_anomalies.pods_saturation.configuration.threshold
      }
    }
  }

  dynamic "readiness_issues" {
    for_each = var.k8s_cluster_anomalies.readiness_issues != null ? [1] : []
    content {
      enabled = var.k8s_cluster_anomalies.readiness_issues.enabled
      configuration {
        observation_period_in_minutes = var.k8s_cluster_anomalies.readiness_issues.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_cluster_anomalies.readiness_issues.configuration.sample_period_in_minutes
      }
    }
  }
}
