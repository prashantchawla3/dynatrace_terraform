output "activegate_updates_id" {
  description = "The ID of the ActiveGate updates resource"
  value       = dynatrace_activegate_updates.example.id
}

output "oneagent_updates_id" {
  description = "The ID of the OneAgent updates resource"
  value       = dynatrace_oneagent_updates.example.id
}

output "update_windows_id" {
  description = "The ID of the update windows resource"
  value       = dynatrace_update_windows.example.id
}