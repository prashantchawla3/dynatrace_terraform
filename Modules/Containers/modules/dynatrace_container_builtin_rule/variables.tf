variable "builtin_rule_enabled" {
  description = "Enable or disable creation of dynatrace_container_builtin_rule"
  type        = bool
  default     = true
}

variable "ignore_docker_pause_container" {
  description = "Disable monitoring of Docker pause containers"
  type        = bool
  default     = false
}

variable "ignore_kubernetes_pause_container" {
  description = "Disable monitoring of Kubernetes pause containers"
  type        = bool
  default     = false
}

variable "ignore_open_shift_build_pod_name" {
  description = "Disable monitoring of OpenShift build pod containers"
  type        = bool
  default     = false
}

variable "ignore_open_shift_sdn_namespace" {
  description = "Disable monitoring of containers in OpenShift SDN namespace"
  type        = bool
  default     = false
}
