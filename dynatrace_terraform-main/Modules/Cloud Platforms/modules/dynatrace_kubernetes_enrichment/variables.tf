variable "kubernetes_enrichment" {
  description = "Kubernetes enrichment configuration using custom rules"
  type = map(object({
    scope = string
    rules = object({
      type   = string
      source = string
      target = string
    })
  }))
  default = {
    enrichment_rule = {
      scope = "enrichment-scope"
      rules = {
        type   = "label"
        source = "namespace"
        target = "environment"
      }
    }
  }
}
