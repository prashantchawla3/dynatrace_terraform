variable "custom_device_id" {
  type = string
}

variable "display_name" {
  type = string
}

variable "config_url" {
  type = string
}

variable "dns_names" {
  type = list(string)
}

variable "favicon_url" {
  type = string
}

variable "group" {
  type = string
}

variable "ip_addresses" {
  type = list(string)
}

variable "listen_ports" {
  type = list(number)
}

variable "props" {
  type = string
}

variable "type" {
  type = string
}

variable "ui_based" {
  type = bool
}

