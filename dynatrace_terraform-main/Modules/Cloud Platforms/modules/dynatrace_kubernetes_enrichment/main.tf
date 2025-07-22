resource "dynatrace_kubernetes_enrichment" "kubernetes_enrichment" {
  for_each = var.kubernetes_enrichment
  scope    = each.value.scope

  rules {
    rule {
      type   = each.value.rules.type
      source = each.value.rules.source
      target = each.value.rules.target
    }
  }
}