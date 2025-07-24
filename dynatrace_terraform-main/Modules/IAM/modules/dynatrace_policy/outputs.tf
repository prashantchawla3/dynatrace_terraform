output "policy_id" {
  description = "Unique identifier for the Dynatrace policy"
  value       = dynatrace_policy.policy.id
}

output "policy_name" {
  description = "Name of the Dynatrace policy"
  value       = dynatrace_policy.policy.name
}

output "policy_statement_query" {
  description = "The statement query defining the policy conditions"
  value       = dynatrace_policy.policy.statement_query
}

output "policy_cluster" {
  description = "Cluster to which the policy applies"
  value       = dynatrace_policy.policy.cluster
}

output "policy_description" {
  description = "Optional description provided for the policy"
  value       = dynatrace_policy.policy.description
}

output "policy_tags" {
  description = "Tags associated with the Dynatrace policy"
  value       = dynatrace_policy.policy.tags
}
