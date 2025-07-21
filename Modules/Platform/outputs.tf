output "generic_setting_ids" {
  value = [for k, v in dynatrace_generic_setting.this : v.id]
}

output "platform_bucket_names" {
  value = [for k, v in dynatrace_platform_bucket.this : v.name]
}

output "problem_field_statuses" {
  value = [for k, v in dynatrace_problem_fields.this : v.enabled]
}

output "security_contexts_enabled" {
  value = [for k, v in dynatrace_security_context.this : v.enabled]
}
