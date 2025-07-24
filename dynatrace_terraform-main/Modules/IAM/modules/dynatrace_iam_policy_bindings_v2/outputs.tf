output "iam_policy_bindings_v2_group" {
  description = "The group associated with the IAM v2 policy bindings"
  value       = dynatrace_iam_policy_bindings_v2.iam_policy_bindings_v2.group
}

output "iam_policy_bindings_v2_account" {
  description = "The Dynatrace account targeted by the IAM v2 policy bindings"
  value       = dynatrace_iam_policy_bindings_v2.iam_policy_bindings_v2.account
}

output "iam_policy_bindings_v2_policies" {
  description = "The list of policies attached via IAM v2 bindings"
  value       = var.iam_policy_bindings_v2_policies
}
