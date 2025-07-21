variable "rum_ip_determination" {
  description = "Defines headers used to determine IP addresses for RUM."
  type = map(object({
    header_name = string
  }))
  default = {
    rid1 = {
      header_name = "X-Header-Example3"
    }
  }
}
