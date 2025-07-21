output "autotag_id" {
  description = "The ID of the Dynatrace auto-tag"
  value       = dynatrace_autotag_v2.example.id
}

output "autotag_rules_id" {
  description = "The ID of the Dynatrace auto-tag rules"
  value       = dynatrace_autotag_rules.example.id
}

output "custom_tags_id" {
  description = "The ID of the Dynatrace custom tags resource"
  value       = dynatrace_custom_tags.example.id
}
