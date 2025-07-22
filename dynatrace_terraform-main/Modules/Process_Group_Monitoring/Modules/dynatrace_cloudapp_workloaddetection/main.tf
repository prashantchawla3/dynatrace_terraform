resource "dynatrace_cloudapp_workloaddetection" "cloud_app_workload_detection" {
  for_each = var.cloudapp_workloaddetection

  cloud_foundry {
    enabled = each.value.cloud_foundry_enabled
  }

  docker {
    enabled = each.value.docker_enabled
  }

  kubernetes {
    enabled = each.value.kubernetes_enabled

    filters {
      dynamic "filter" {
        for_each = each.value.kubernetes_filters
        content {
          enabled = filter.value.enabled

          inclusion_toggles {
            inc_basepod   = filter.value.inc_basepod
            inc_container = filter.value.inc_container
            inc_namespace = filter.value.inc_namespace
            inc_product   = filter.value.inc_product
            inc_stage     = filter.value.inc_stage
          }

          match_filter {
            match_operator = filter.value.match_operator
          }
        }
      }
    }
  }
}