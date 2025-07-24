output "iam_policy_bindings_id" {
  description = "The unique identifier for the IAM policy bindings resource"
  value       = dynatrace_iam_policy_bindings.iam_policy_bindings.id
}

output "iam_policy_bindings_group" {
  description = "The group associated with the IAM policy bindings"
  value       = dynatrace_iam_policy_bindings.iam_policy_bindings.group
}

output "iam_policy_bindings_account" {
  description = "The account targeted by the IAM policy bindings"
  value       = dynatrace_iam_policy_bindings.iam_policy_bindings.account
}

output "iam_policy_bindings_policies" {
  description = "The list of policies bound via IAM"
  value       = dynatrace_iam_policy_bindings.iam_policy_bindings.policies
}
