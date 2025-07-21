resource "dynatrace_grail_metrics_allowall" "this" {
  for_each = var.grail_allowall
  allow_all = each.value.allow_all
}
