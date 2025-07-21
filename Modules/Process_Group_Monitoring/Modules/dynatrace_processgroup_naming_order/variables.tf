variable "pg_naming_order" {
  description = "List of process group naming rule resource IDs in order of evaluation priority."
  type        = list(string)
  default     = [
    "dynatrace_processgroup_naming.first.id",
    "dynatrace_processgroup_naming.second.id"
  ]
}
