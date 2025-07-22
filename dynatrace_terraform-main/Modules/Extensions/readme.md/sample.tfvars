execution_controllers = [
  {
    enabled             = true
    ingest_active       = false
    performance_profile = "DEFAULT"
    scope               = "environment"
    statsd_active       = false
  }
]

execution_remotes = [
  {
    performance_profile = "DEFAULT"
    scope               = "ENVIRONMENT_ACTIVE_GATE-1234567890000000"
  }
]

hub_extension_versions = [
  {
    name    = "com.dynatrace.extension.active-directory-python"
    version = "3.1.6"
  }
]

hub_extension_configs = [
  {
    name        = "com.dynatrace.extension.jmx-weblogic-cp"
    enabled     = true
    description = "jj"
    version     = "2.0.4"
    featureSets = ["cache", "connections", "capacity"]
  }
]
