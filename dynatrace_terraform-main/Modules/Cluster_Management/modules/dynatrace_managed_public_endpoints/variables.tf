variable "public_endpoints_web_ui_address" {
  description = "Primary public address for accessing the Dynatrace Web UI"
  type        = string
  default     = "https://dynatrace.example.com"
}

variable "public_endpoints_additional_web_ui_addresses" {
  description = "List of additional public addresses for accessing the Web UI"
  type        = list(string)
  default     = ["https://dynatrace-alt1.example.com", "https://dynatrace-alt2.example.com"]
}

variable "public_endpoints_beacon_forwarder_address" {
  description = "Public address for the beacon forwarder"
  type        = string
  default     = "https://beacon.example.com"
}

variable "public_endpoints_cdn_address" {
  description = "Public address for the content delivery network (CDN)"
  type        = string
  default     = "https://cdn.example.com"
}
