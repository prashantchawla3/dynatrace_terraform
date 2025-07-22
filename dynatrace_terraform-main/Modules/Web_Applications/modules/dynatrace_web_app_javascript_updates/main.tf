resource "dynatrace_web_app_javascript_updates" "this" {
  application_id     = var.application_id
  javascript_version = var.javascript_version
}
