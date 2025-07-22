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
