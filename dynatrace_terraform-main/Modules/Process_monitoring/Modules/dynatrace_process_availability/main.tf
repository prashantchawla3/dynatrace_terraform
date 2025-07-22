resource "dynatrace_process_availability" "process_availability" {
  enabled = var.process_availability_enabled
  name    = var.process_availability_name
  rules {
    rule {
      property  = var.process_availability_rule_property
      condition = var.process_availability_rule_condition
    }
  }
  metadata {
    item {
      key   = var.process_availability_metadata_key
      value = var.process_availability_metadata_value
    }
  }
}
