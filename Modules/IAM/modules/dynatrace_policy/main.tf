resource "dynatrace_policy" "policy" {
  name            = var.policy_name
  statement_query = var.policy_statement_query
  cluster         = var.policy_cluster
  description     = var.policy_description
  tags            = var.policy_tags
}
