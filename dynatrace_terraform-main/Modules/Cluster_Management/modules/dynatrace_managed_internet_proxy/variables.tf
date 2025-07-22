variable "proxy_scheme" {
  description = "The scheme used by the proxy (e.g., http or https)"
  type        = string
  default     = "https"
}

variable "proxy_server" {
  description = "The proxy server address"
  type        = string
  default     = "proxy.example.com"
}

variable "proxy_port" {
  description = "The port used by the proxy server"
  type        = number
  default     = 8080
}

variable "proxy_user" {
  description = "Username for proxy authentication"
  type        = string
  default     = "proxyuser"
}

variable "proxy_password" {
  description = "Password for proxy authentication"
  type        = string
  default     = "proxypassword"
  sensitive   = true
}

variable "proxy_non_proxy_hosts" {
  description = "List of hosts that should bypass the proxy"
  type        = list(string)
  default     = ["localhost", "127.0.0.1"]
}
