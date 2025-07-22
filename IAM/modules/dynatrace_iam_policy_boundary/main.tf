resource "dynatrace_iam_policy_boundary" "iam_policy_boundary" {
  name  = var.iam_policy_boundary_name
  query = var.iam_policy_boundary_query
}
