
variable "environment_url" { type = string }
variable "dynatrace_client_id" { type = string }
variable "dynatrace_client_secret" { type = string, sensitive = true }

variable "enabled_vmware" {
  description = "Enable or disable the VMware integration"
  type        = bool
}

variable "ipaddress" {
  description = "IP address or hostname of vCenter or standalone ESXi"
  type        = string
}

variable "label" {
  description = "Label for the connection"
  type        = string
}

variable "password" {
  description = "Password for vCenter or ESXi"
  type        = string
  sensitive   = true
}

variable "username" {
  description = "Username for vCenter or ESXi"
  type        = string
}

variable "filter" {
  description = "Optional filter string"
  type        = string
  default     = ""
}
