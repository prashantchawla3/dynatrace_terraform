resource "dynatrace_iam_policy_bindings_v2" "iam_policy_bindings_v2" {
  group   = var.iam_policy_bindings_v2_group
  account = var.iam_policy_bindings_v2_account

  dynamic "policy" {
    for_each = var.iam_policy_bindings_v2_policies
    content {
      id         = policy.value.id
      parameters = policy.value.parameters
      metadata   = policy.value.metadata
    }
  }
}
