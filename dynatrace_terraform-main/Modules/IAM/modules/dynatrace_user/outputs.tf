output "user_id" {
  description = "The unique identifier of the created Dynatrace user"
  value       = dynatrace_user.user.id
}

output "user_email" {
  description = "The email address associated with the Dynatrace user"
  value       = dynatrace_user.user.email
}

output "user_name" {
  description = "The username used for the Dynatrace user login"
  value       = dynatrace_user.user.user_name
}

output "user_groups" {
  description = "The list of groups the user is assigned to"
  value       = dynatrace_user.user.groups
}
