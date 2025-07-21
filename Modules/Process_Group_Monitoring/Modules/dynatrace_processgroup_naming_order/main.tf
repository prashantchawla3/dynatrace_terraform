resource "dynatrace_processgroup_naming_order" "this" {
  naming_rule_ids = var.pg_naming_order
}
