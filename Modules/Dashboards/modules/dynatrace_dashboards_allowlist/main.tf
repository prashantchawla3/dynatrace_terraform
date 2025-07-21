resource "dynatrace_dashboards_allowlist" "this" {
  allowlist {
    dynamic "urlpattern" {
      for_each = var.allowlist_urlpatterns
      content {
        rule     = urlpattern.value.rule
        template = urlpattern.value.template
      }
    }
  }
}
