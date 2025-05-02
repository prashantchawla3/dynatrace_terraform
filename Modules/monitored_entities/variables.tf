
variable "custom_device_id" {
  description = "The ID of the custom device"
  type        = string
}

variable "display_name" {
  description = "Display name of the custom device"
  type        = string
}

variable "config_url" {
  description = "Configuration URL"
  type        = string
}

variable "dns_names" {
  description = "List of DNS names"
  type        = list(string)
}

variable "favicon_url" {
  description = "URL for the favicon"
  type        = string
}

variable "group" {
  description = "Device group"
  type        = string
}

variable "ip_addresses" {
  description = "List of IP addresses"
  type        = list(string)
}

variable "listen_ports" {
  description = "List of listening ports"
  type        = list(number)
}

variable "props" {
  description = "Custom properties in key=value format"
  type        = string
}

variable "type" {
  description = "Type of the custom device"
  type        = string
}

variable "ui_based" {
  description = "Whether the device is UI-based"
  type        = bool
}
