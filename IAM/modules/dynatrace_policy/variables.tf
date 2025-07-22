variable "policy_name" {
  description = "Name of the cluster policy"
  type        = string
  default     = "cluster-policy-core"
}

variable "policy_statement_query" {
  description = "Statement query for the cluster policy"
  type        = string
  default     = "allow cluster visibility for SRE team"
}

variable "policy_cluster" {
  description = "Cluster for the policy"
  type        = string
  default     = "cluster-core-prod"
}

variable "policy_description" {
  description = "Description of the cluster policy"
  type        = string
  default     = "Used to control access to core production cluster"
}

variable "policy_tags" {
  description = "Tags for the cluster policy"
  type        = set(string)
  default     = ["cluster", "core", "access"]
}
