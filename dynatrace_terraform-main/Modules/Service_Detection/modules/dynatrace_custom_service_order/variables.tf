variable "custom_service_order" {
  description = "Ordering of custom services per technology to define precedence during detection."
  type = object({
    dotnet = list(string)
    java   = list(string)
  })
  default = {
    dotnet = [],
    java   = []
  }
}
