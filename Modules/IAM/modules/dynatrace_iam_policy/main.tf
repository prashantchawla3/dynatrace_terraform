resource "dynatrace_iam_policy" "iam_policy" {
  name            = var.iam_policy_name
  statement_query = var.iam_policy_statement_query
  account         = var.iam_policy_account
  description     = var.iam_policy_description
  tags            = var.iam_policy_tags
}
