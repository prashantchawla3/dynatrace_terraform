resource "dynatrace_log_agent_feature_flags" "example" {
  scope                      = var.scope
  new_container_log_detector = var.new_container_log_detector
  journald_log_detector      = var.journald_log_detector
}

resource "dynatrace_log_buckets" "example" {
  enabled     = var.enabled_buckets
  bucket_name = var.bucket_name
  matcher     = var.matcher_buckets
  rule_name   = var.rule_name_buckets
  insert_after = var.insert_after_buckets
}

resource "dynatrace_log_custom_attribute" "example" {
  sidebar = var.sidebar_custom_attribute
  key     = var.key_custom_attribute
}

resource "dynatrace_log_custom_source" "example" {
  name    = var.name_custom_source
  enabled = var.enabled_custom_source
  scope   = var.scope_custom_source
  custom_log_source {
    type = var.custom_log_source_type
    values_and_enrichment {
      custom_log_source_with_enrichment {
        path = var.custom_log_source_path
        enrichment {
          enrichment {
            type  = var.enrichment_type_custom_source
            key   = var.enrichment_key1_custom_source
            value = var.enrichment_value1_custom_source
          }
          enrichment {
            type  = var.enrichment_type_custom_source
            key   = var.enrichment_key2_custom_source
            value = var.enrichment_value2_custom_source
          }
        }
      }
    }
  }
}