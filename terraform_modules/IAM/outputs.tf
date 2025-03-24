output "iam_group_id" {
  description = "ID of the IAM group"
  value       = dynatrace_iam_group.iam_group.id
}

output "iam_permission_id" {
  description = "ID of the IAM permission"
  value       = dynatrace_iam_permission.iam_permission.id
}

output "iam_policy_id" {
  description = "ID of the IAM policy"
  value       = dynatrace_iam_policy.iam_policy.id
}

output "iam_policy_bindings_id" {
  description = "ID of the IAM policy bindings"
  value       = dynatrace_iam_policy_bindings.iam_policy_bindings.id
}

output "iam_policy_bindings_v2_id" {
  description = "ID of the IAM policy bindings v2"
  value       = dynatrace_iam_policy_bindings_v2.iam_policy_bindings_v2.id
}

output "iam_policy_boundary_id" {
  description = "ID of the IAM policy boundary"
  value       = dynatrace_iam_policy_boundary.iam_policy_boundary.id
}

output "iam_user_id" {
  description = "ID of the IAM user"
  value       = dynatrace_iam_user.iam_user.id
}

output "mgmz_permission_id" {
  description = "ID of the management zone permission"
  value       = dynatrace_mgmz_permission.mgmz_permission.id
}

output "policy_id" {
  description = "ID of the policy"
  value       = dynatrace_policy.policy.id
}

output "policy_bindings_id" {
  description = "ID of the policy bindings"
  value       = dynatrace_policy_bindings.policy_bindings.id
}

output "user_id" {
  description = "ID of the user"
  value       = dynatrace_user.user.id
}

output "user_group_id" {
  description = "ID of the user group"
  value       = dynatrace_user_group.user_group.id
}