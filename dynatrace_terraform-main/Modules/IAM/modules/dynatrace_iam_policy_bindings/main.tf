resource "dynatrace_iam_policy_bindings" "iam_policy_bindings" {
  group    = var.iam_policy_bindings_group
  account  = var.iam_policy_bindings_account
  policies = var.iam_policy_bindings_policies
}
