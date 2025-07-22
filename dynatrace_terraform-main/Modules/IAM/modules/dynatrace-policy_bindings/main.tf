resource "dynatrace_policy_bindings" "policy_bindings" {
  group    = var.policy_bindings_group
  cluster  = var.policy_bindings_cluster
  policies = var.policy_bindings_policies
}
