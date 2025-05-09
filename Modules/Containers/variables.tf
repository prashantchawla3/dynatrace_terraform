
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

#############################
# Container Registry Variables
#############################
variable "registry_enabled" {
  description = "Enable or disable creation of dynatrace_container_registry"
  type        = bool
  default     = true
}

variable "container_registry" {
  description = "Container registry to configure"
  type        = string
  default     = ""
}

##########################
# Container Rule Variables
##########################
variable "container_rule_enabled" {
  description = "Enable or disable creation of dynatrace_container_rule"
  type        = bool
  default     = true
}

variable "container_rule_mode" {
  description = "Mode of the container rule (e.g., EXCLUDE)"
  type        = string
  default     = "EXCLUDE"
}

variable "container_rule_operator" {
  description = "Operator to use for the rule (e.g., EQUALS)"
  type        = string
  default     = "EQUALS"
}

variable "container_rule_property" {
  description = "Property to match in the rule (e.g., CONTAINER_NAME)"
  type        = string
  default     = "CONTAINER_NAME"
}

variable "container_rule_value" {
  description = "Value to match in the rule"
  type        = string
  default     = ""
}

##############################
# Container Technology Variables
##############################
variable "technology_enabled" {
  description = "Enable or disable creation of dynatrace_container_technology"
  type        = bool
  default     = true
}

variable "bosh_process_manager" {
  description = "Enable monitoring for BOSH"
  type        = bool
  default     = false
}

variable "containerd" {
  description = "Enable monitoring for containerd"
  type        = bool
  default     = true
}

variable "crio" {
  description = "Enable monitoring for CRI-O"
  type        = bool
  default     = true
}

variable "docker" {
  description = "Enable monitoring for Docker"
  type        = bool
  default     = true
}

variable "docker_windows" {
  description = "Enable monitoring for Docker on Windows"
  type        = bool
  default     = false
}

variable "garden" {
  description = "Enable monitoring for Garden"
  type        = bool
  default     = false
}

variable "podman" {
  description = "Enable monitoring for Podman"
  type        = bool
  default     = false
}

variable "scope" {
  description = "Scope for the container technology (e.g., environment scope)"
  type        = string
  default     = ""
}

variable "winc" {
  description = "Enable monitoring for Windows containers (winc)"
  type        = bool
  default     = false
}
