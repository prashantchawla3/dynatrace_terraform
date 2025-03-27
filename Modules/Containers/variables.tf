variable "ignore_docker_pause_container" {
  description = "Disable monitoring of platform internal pause containers in Kubernetes and OpenShift"
  type        = bool
  default     = false
}

variable "ignore_kubernetes_pause_container" {
  description = "Disable monitoring of platform internal pause containers in Kubernetes and OpenShift"
  type        = bool
  default     = true
}

variable "ignore_open_shift_build_pod_name" {
  description = "Disable monitoring of intermediate containers created during image build"
  type        = bool
  default     = false
}

variable "ignore_open_shift_sdn_namespace" {
  description = "Disable monitoring of platform internal containers in the openshift-sdn namespace"
  type        = bool
  default     = true
}

variable "container_registry" {
  description = "The container registry URL"
  type        = string
}

variable "container_rule_enabled" {
  description = "This setting is enabled (true) or disabled (false)"
  type        = bool
  default     = true
}

variable "container_rule_mode" {
  description = "Possible Values: MONITORING_OFF, MONITORING_ON"
  type        = string
  default     = "MONITORING_ON"
}

variable "container_rule_operator" {
  description = "Possible Values: CONTAINS, ENDS, EQUALS, EXISTS, NOT_CONTAINS, NOT_ENDS, NOT_EQUALS, NOT_EXISTS, NOT_STARTS, STARTS"
  type        = string
  default     = "NOT_CONTAINS"
}

variable "container_rule_property" {
  description = "Possible Values: CONTAINER_NAME, IMAGE_NAME, KUBERNETES_BASEPODNAME, KUBERNETES_CONTAINERNAME, KUBERNETES_FULLPODNAME, KUBERNETES_NAMESPACE, KUBERNETES_PODUID"
  type        = string
  default     = "CONTAINER_NAME"
}

variable "container_rule_value" {
  description = "Condition value"
  type        = string
  default     = "Terraform"
}

variable "bosh_process_manager" {
  description = "Platform: Cloud Foundry"
  type        = bool
  default     = true
}

variable "containerd" {
  description = "Platform: Kubernetes"
  type        = bool
  default     = true
}

variable "crio" {
  description = "Platform: Kubernetes"
  type        = bool
  default     = true
}

variable "docker" {
  description = "Platform: Docker and Kubernetes"
  type        = bool
  default     = true
}

variable "docker_windows" {
  description = "Platform: Docker"
  type        = bool
  default     = true
}

variable "garden" {
  description = "Platform: Cloud Foundry"
  type        = bool
  default     = true
}

variable "podman" {
  description = "Platform: Podman"
  type        = bool
  default     = true
}

variable "scope" {
  description = "The scope of this setting (HOST, HOST_GROUP). Omit this property if you want to cover the whole environment."
  type        = string
  default     = "environment"
}

variable "winc" {
  description = "Platform: Cloud Foundry"
  type        = bool
  default     = true
}
