variable "enabled_vmware" {
  description = "This setting is enabled (true) or disabled (false)"
  type        = bool
}

variable "ipaddress" {
  description = "Specify the IP address or name of the vCenter or standalone ESXi host"
  type        = string
}

variable "label" {
  description = "Name this connection"
  type        = string
}

variable "password" {
  description = "Provide the password for the vCenter or standalone ESXi host"
  type        = string
  sensitive   = true
}

variable "username" {
  description = "Provide user credentials for the vCenter or standalone ESXi host"
  type        = string
}

variable "filter" {
  description = "Filter string for the VMware resource"
  type        = string
  default     = ""
}