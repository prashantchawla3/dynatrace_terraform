output "execution_remote_ids" {
  value = [for r in dynatrace_extension_execution_remote.this : r.id]
}
