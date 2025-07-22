resource "dynatrace_kubernetes_app" "kubernetes_app" {
  for_each = var.kubernetes_app
  scope    = each.value.scope

  kubernetes_app_options {
    enable_kubernetes_app = each.value.enable_kubernetes_app
  }
}
