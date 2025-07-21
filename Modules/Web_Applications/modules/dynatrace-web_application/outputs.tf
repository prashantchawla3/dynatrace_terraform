
output "web_application_ids" {
  value = { for k, v in dynatrace_web_application.this : k => v.id }
}
