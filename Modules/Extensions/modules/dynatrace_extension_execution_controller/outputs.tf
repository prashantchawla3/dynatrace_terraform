output "execution_controller_ids" {
  value = [for r in dynatrace_extension_execution_controller.this : r.id]
}