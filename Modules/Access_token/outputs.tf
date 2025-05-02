
output "activegate_token" {
  value = dynatrace_activegate_token.example
}

output "ag_token" {
  value     = dynatrace_ag_token.example
  sensitive = true
}

output "api_token" {
  value     = dynatrace_api_token.example
  sensitive = true
}

output "token_settings" {
  value = dynatrace_token_settings.example
}
