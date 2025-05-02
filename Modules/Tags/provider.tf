
output "autotag_id" {
  value       = dynatrace_autotag_v2.example.id
  description = "ID of the created auto tag"
}

output "autotag_rules_id" {
  value       = dynatrace_autotag_rules.example.id
  description = "ID of the created auto tag rule"
}

output "custom_tags_id" {
  value       = dynatrace_custom_tags.example.id
  description = "ID of the created custom tags"
}
