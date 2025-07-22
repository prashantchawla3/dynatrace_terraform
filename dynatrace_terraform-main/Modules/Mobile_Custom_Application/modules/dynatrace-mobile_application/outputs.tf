output "mobile_application_names" {
  value = { for k, v in dynatrace_mobile_application.this : k => v.name }
}