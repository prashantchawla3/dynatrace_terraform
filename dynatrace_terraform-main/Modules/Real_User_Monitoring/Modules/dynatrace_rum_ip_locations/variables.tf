variable "rum_ip_locations" {
  description = "Defines static IP location mappings for RUM."
  type = map(object({
    country_code = string
    ip           = string
    ip_to        = string
    region_code  = string
  }))
  default = {
    ril1 = {
      country_code = "ZA"
      ip           = "192.168.3.1"
      ip_to        = "192.168.3.100"
      region_code  = "05"
    }
  }
}