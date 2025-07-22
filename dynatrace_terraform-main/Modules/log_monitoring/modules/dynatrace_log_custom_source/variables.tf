variable "log_custom_source" {
  description = "Custom log source definitions with enrichment logic"
  type = map(object({
    name    = string
    enabled = bool
    scope   = string
    custom_log_source = object({
      type = string
      values_and_enrichment = list(object({
        custom_log_source_with_enrichment = object({
          path = string
          enrichment = list(object({
            type  = string
            key   = string
            value = string
          }))
        })
      }))
    })
  }))
  default = {}
}
