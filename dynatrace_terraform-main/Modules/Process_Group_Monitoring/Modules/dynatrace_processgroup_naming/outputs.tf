output "pg_naming_ids" {
  description = "Map of process group naming rules to their resource IDs"
  value = {
    for key, res in dynatrace_processgroup_naming.this :
    key => res.id
  }
}

output "pg_naming_formats" {
  description = "Map of process group naming rules to their format strings"
  value = {
    for key, res in dynatrace_processgroup_naming.this :
    key => res.format
  }
}

output "pg_naming_enabled_flags" {
  description = "Map of process group naming rules to their enabled status"
  value = {
    for key, res in dynatrace_processgroup_naming.this :
    key => res.enabled
  }
}
