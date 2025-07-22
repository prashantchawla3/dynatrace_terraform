variable "hub_extension_versions" {
  description = "List of Dynatrace Hub extensions and their required versions for compatibility checks."
  type = list(object({
    name    = string
    version = string
  }))
  default = [
    { name = "aws-cloudwatch", version = "1.2.0" },
    { name = "prometheus-exporter", version = "2.0.1" }
  ]
}
