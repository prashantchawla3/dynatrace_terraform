output "problem_propagation_rule_ids" {
  description = "Map of problem propagation rule keys to their resource IDs"
  value = {
    for key, res in dynatrace_problem_record_propagation_rules.this :
    key => res.id
  }
}

output "problem_propagation_rule_sources" {
  description = "Map of rule keys to their source attribute keys"
  value = {
    for key, res in dynatrace_problem_record_propagation_rules.this :
    key => res.source_attribute_key
  }
}

output "problem_propagation_rule_targets" {
  description = "Map of rule keys to their target attribute keys"
  value = {
    for key, res in dynatrace_problem_record_propagation_rules.this :
    key => res.target_attribute_key
  }
}
