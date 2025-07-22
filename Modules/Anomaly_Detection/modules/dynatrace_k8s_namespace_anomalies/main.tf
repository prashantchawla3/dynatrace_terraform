resource "dynatrace_k8s_namespace_anomalies" "this" {
  scope = var.k8s_namespace_anomalies.scope

  dynamic "cpu_limits_quota_saturation" {
    for_each = var.k8s_namespace_anomalies.cpu_limits_quota_saturation != null ? [1] : []
    content {
      enabled = var.k8s_namespace_anomalies.cpu_limits_quota_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_namespace_anomalies.cpu_limits_quota_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_namespace_anomalies.cpu_limits_quota_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_namespace_anomalies.cpu_limits_quota_saturation.configuration.threshold
      }
    }
  }

  dynamic "cpu_requests_quota_saturation" {
    for_each = var.k8s_namespace_anomalies.cpu_requests_quota_saturation != null ? [1] : []
    content {
      enabled = var.k8s_namespace_anomalies.cpu_requests_quota_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_namespace_anomalies.cpu_requests_quota_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_namespace_anomalies.cpu_requests_quota_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_namespace_anomalies.cpu_requests_quota_saturation.configuration.threshold
      }
    }
  }

  dynamic "memory_limits_quota_saturation" {
    for_each = var.k8s_namespace_anomalies.memory_limits_quota_saturation != null ? [1] : []
    content {
      enabled = var.k8s_namespace_anomalies.memory_limits_quota_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_namespace_anomalies.memory_limits_quota_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_namespace_anomalies.memory_limits_quota_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_namespace_anomalies.memory_limits_quota_saturation.configuration.threshold
      }
    }
  }

  dynamic "memory_requests_quota_saturation" {
    for_each = var.k8s_namespace_anomalies.memory_requests_quota_saturation != null ? [1] : []
    content {
      enabled = var.k8s_namespace_anomalies.memory_requests_quota_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_namespace_anomalies.memory_requests_quota_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_namespace_anomalies.memory_requests_quota_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_namespace_anomalies.memory_requests_quota_saturation.configuration.threshold
      }
    }
  }

  dynamic "pods_quota_saturation" {
    for_each = var.k8s_namespace_anomalies.pods_quota_saturation != null ? [1] : []
    content {
      enabled = var.k8s_namespace_anomalies.pods_quota_saturation.enabled
      configuration {
        observation_period_in_minutes = var.k8s_namespace_anomalies.pods_quota_saturation.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_namespace_anomalies.pods_quota_saturation.configuration.sample_period_in_minutes
        threshold                     = var.k8s_namespace_anomalies.pods_quota_saturation.configuration.threshold
      }
    }
  }
}