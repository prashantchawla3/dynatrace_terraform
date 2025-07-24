output "policy_bindings_id" {
  description = "The ID of the created policy bindings resource"
  value       = dynatrace_policy_bindings.policy_bindings.id
}

output "policy_bindings_group" {
  description = "The group associated with the policy bindings"
  value       = dynatrace_policy_bindings.policy_bindings.group
}

output "policy_bindings_cluster" {
  description = "The cluster configured in the policy bindings"
  value       = dynatrace_policy_bindings.policy_bindings.cluster
}

output "policy_bindings_policies" {
  description = "The list of policies bound to the policy bindings resource"
  value       = dynatrace_policy_bindings.policy_bindings.policies
}
