output "pg_detection_flag_ids" {
  description = "Map of process group detection flag keys to their resource IDs"
  value = {
    for key, res in dynatrace_process_group_detection_flags.this :
    key => res.id
  }
}

output "pg_detection_flag_scopes" {
  description = "Map of detection flag keys to their scopes"
  value = {
    for key, res in dynatrace_process_group_detection_flags.this :
    key => res.scope
  }
}

output "pg_detection_flag_nodejs_script_name_enabled" {
  description = "Map of detection flag keys to their Node.js script name detection setting"
  value = {
    for key, res in dynatrace_process_group_detection_flags.this :
    key => res.add_node_js_script_name
  }
}
