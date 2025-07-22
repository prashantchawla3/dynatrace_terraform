variable "custom_device_id" {
  description = "The unique ID of the custom device for identification and reference"
  type        = string
  default     = "custom-device-01"
}

variable "display_name" {
  description = "Display name of the custom device shown in Dynatrace UI"
  type        = string
  default     = "Synthetic Router"
}

variable "config_url" {
  description = "Configuration URL for accessing device metadata or external config view"
  type        = string
  default     = "https://config.devices.local/router01"
}

variable "dns_names" {
  description = "DNS names associated with the custom device"
  type        = list(string)
  default     = ["router01.local", "synthetic-router.internal"]
}

variable "favicon_url" {
  description = "URL to the favicon representing this device in the Dynatrace UI"
  type        = string
  default     = "https://cdn.icons.local/router.svg"
}

variable "group" {
  description = "Group name that categorizes this custom device (e.g. routers, databases)"
  type        = string
  default     = "synthetic-network"
}

variable "ip_addresses" {
  description = "List of IP addresses associated with this device"
  type        = list(string)
  default     = ["10.0.0.1", "10.0.0.2"]
}

variable "listen_ports" {
  description = "List of ports that this device listens on"
  type        = list(number)
  default     = [80, 443, 8443]
}

variable "props" {
  description = "Custom properties formatted as key=value pairs for device context"
  type        = string
  default     = "location=DC1;role=router"
}

variable "type" {
  description = "Device type identifier (used for classification or API mappings)"
  type        = string
  default     = "synthetic-router"
}

variable "ui_based" {
  description = "Whether the custom device was created via the Dynatrace UI"
  type        = bool
  default     = false
}
