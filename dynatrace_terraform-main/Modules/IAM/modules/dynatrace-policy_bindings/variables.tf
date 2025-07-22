variable "policy_bindings_group" {
  description = "Group for cluster policy bindings"
  type        = string
  default     = "platform-admins"
}

variable "policy_bindings_cluster" {
  description = "Cluster for policy bindings"
  type        = string
  default     = "cluster-core-prod"
}

variable "policy_bindings_policies" {
  description = "List of policy IDs for cluster policy bindings"
  type        = list(string)
  default     = ["cluster-policy-core"]
}
