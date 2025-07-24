output "iam_policy_boundary_id" {
  description = "The unique identifier for the IAM policy boundary"
  value       = dynatrace_iam_policy_boundary.iam_policy_boundary.id
}

output "iam_policy_boundary_name" {
  description = "The name assigned to the IAM policy boundary"
  value       = dynatrace_iam_policy_boundary.iam_policy_boundary.name
}

output "iam_policy_boundary_query" {
  description = "The query condition used to define the IAM policy boundary"
  value       = dynatrace_iam_policy_boundary.iam_policy_boundary.query
}
