resource "dynatrace_business_events_processing" "this" {
  enabled   = var.processing_enabled
  matcher   = var.processing_matcher
  rule_name = var.rule_name
  script    = var.processing_script

  rule_testing {
    sample_event = var.sample_event
  }

  transformation_fields {
    dynamic "transformation_field" {
      for_each = var.transformation_fields
      content {
        name     = transformation_field.value.name
        type     = transformation_field.value.type
        array    = transformation_field.value.array
        optional = transformation_field.value.optional
        readonly = transformation_field.value.readonly
      }
    }
  }
}
