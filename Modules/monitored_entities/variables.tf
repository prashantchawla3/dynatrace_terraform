variable "custom_device_id" {
  description = "The unique ID of the custom device"
  type        = string
}

variable "display_name" {
  description = "Display name of the custom device"
  type        = string
}

variable "config_url" {
  description = "Configuration URL for the device"
  type        = string
}

variable "dns_names" {
  description = "DNS names of the device"
  type        = list(string)
}

variable "favicon_url" {
  description = "URL of the favicon to show for the custom device"
  type        = string
}

variable "group" {
  description = "Custom group the device belongs to"
  type        = string
}

variable "ip_addresses" {
  description = "IP addresses of the device"
  type        = list(string)
}

variable "listen_ports" {
  description = "Ports the device listens on"
  type        = list(number)
}

variable "props" {
  description = "Custom properties in key=value format"
  type        = string
}

variable "type" {
  description = "Device type identifier"
  type        = string
}

variable "ui_based" {
  description = "Whether the device was created via UI"
  type        = bool
}

variable "dynatrace_api_url" {
  description = "Dynatrace API URL"
  type        = string
}

variable "dynatrace_api_token" {
  description = "Dynatrace API token"
  type        = string
  sensitive   = true
}