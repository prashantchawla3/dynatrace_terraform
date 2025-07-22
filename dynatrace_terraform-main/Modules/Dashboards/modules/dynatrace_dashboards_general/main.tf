resource "dynatrace_dashboards_general" "this" {
  enable_public_sharing = var.enable_public_sharing

  default_dashboard_list {
    dynamic "default_dashboard" {
      for_each = var.default_dashboards
      content {
        dashboard  = default_dashboard.value.dashboard
        user_group = default_dashboard.value.user_group
      }
    }
  }
}