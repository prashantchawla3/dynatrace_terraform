variable "execution_controllers" {
  description = "List of Dynatrace execution controller configurations. Each controller manages data ingestion and StatsD collection with optional performance profiles."
  type = list(object({
    enabled             = bool
    ingest_active       = bool
    performance_profile = string
    scope               = string
    statsd_active       = bool
  }))
  default = [
    {
      enabled             = true
      ingest_active       = true
      performance_profile = "high-throughput"
      scope               = "host:prod-controller-01"
      statsd_active       = true
    }
  ]
}

variable "execution_remotes" {
  description = "List of Dynatrace execution remote configurations. Used to define remote endpoints associated with performance profiles and scope."
  type = list(object({
    performance_profile = string
    scope               = string
  }))
  default = [
    {
      performance_profile = "edge-cache"
      scope               = "env:staging"
    }
  ]
}

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
