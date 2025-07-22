variable "hub_extension_configs" {
  description = "List of Dynatrace Hub extension configuration values. Each defines enablement status, description, version, and associated feature sets."
  type = list(object({
    name        = string
    enabled     = bool
    description = string
    version     = string
    featureSets = list(string)
  }))
  default = [
    {
      name        = "aws-cloudwatch"
      enabled     = true
      description = "Monitors CloudWatch metrics and AWS tags"
      version     = "1.2.0"
      featureSets = ["logs", "metrics"]
    },
    {
      name        = "prometheus-exporter"
      enabled     = false
      description = "Exports Prometheus data to Dynatrace"
      version     = "2.0.1"
      featureSets = ["custom-metrics"]
    }
  ]
}
