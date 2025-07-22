resource "dynatrace_activegate_updates" "this" {
  auto_update = var.auto_update
  scope       = var.scope_activegate
}