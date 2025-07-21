variable "rum_host_headers" {
  description = "Configures the host header name used in RUM settings."
  type = map(object({
    header_name = string
  }))
  default = {
    rhh1 = {
      header_name = "example-header"
    }
  }
}
