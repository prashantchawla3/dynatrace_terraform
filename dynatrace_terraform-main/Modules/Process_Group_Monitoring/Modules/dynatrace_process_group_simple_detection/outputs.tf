output "pg_simple_detection_ids" {
  description = "Map of process group simple detection keys to their resource IDs"
  value = {
    for key, res in dynatrace_process_group_simple_detection.this :
    key => res.id
  }
}

output "pg_simple_detection_group_identifiers" {
  description = "Map of detection keys to their group identifiers"
  value = {
    for key, res in dynatrace_process_group_simple_detection.this :
    key => res.group_identifier
  }
}

output "pg_simple_detection_instance_identifiers" {
  description = "Map of detection keys to their instance identifiers"
  value = {
    for key, res in dynatrace_process_group_simple_detection.this :
    key => res.instance_identifier
  }
}

output "pg_simple_detection_process_types" {
  description = "Map of detection keys to their process types"
  value = {
    for key, res in dynatrace_process_group_simple_detection.this :
    key => res.process_type
  }
}

output "pg_simple_detection_rule_types" {
  description = "Map of detection keys to their rule types"
  value = {
    for key, res in dynatrace_process_group_simple_detection.this :
    key => res.rule_type
  }
}
