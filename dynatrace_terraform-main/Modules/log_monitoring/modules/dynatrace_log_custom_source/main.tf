resource "dynatrace_log_custom_source" "this" {
  for_each = var.resources["log_custom_source"]

  name    = each.value.name
  enabled = each.value.enabled
  scope   = each.value.scope

  custom_log_source {
    type = each.value.custom_log_source.type

    values_and_enrichment {
      custom_log_source_with_enrichment {
        path = each.value.custom_log_source.values_and_enrichment[0].custom_log_source_with_enrichment.path

        enrichment {
          enrichment {
            type  = each.value.custom_log_source.values_and_enrichment[0].custom_log_source_with_enrichment.enrichment[0].type
            key   = each.value.custom_log_source.values_and_enrichment[0].custom_log_source_with_enrichment.enrichment[0].key
            value = each.value.custom_log_source.values_and_enrichment[0].custom_log_source_with_enrichment.enrichment[0].value
          }

          enrichment {
            type  = each.value.custom_log_source.values_and_enrichment[0].custom_log_source_with_enrichment.enrichment[1].type
            key   = each.value.custom_log_source.values_and_enrichment[0].custom_log_source_with_enrichment.enrichment[1].key
            value = each.value.custom_log_source.values_and_enrichment[0].custom_log_source_with_enrichment.enrichment[1].value
          }
        }
      }
    }
  }
}
