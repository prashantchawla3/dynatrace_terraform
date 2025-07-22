variable "network_traffic" {
  description = "Define custom network traffic endpoints per host and interface"
  type = list(object({
    host_id    = string
    ip_address = string
    interface  = string
    os         = string
  }))
  default = [
    {
      host_id    = "host-01"
      ip_address = "10.10.10.10"
      interface  = "eth0"
      os         = "linux"
    }
  ]
}
