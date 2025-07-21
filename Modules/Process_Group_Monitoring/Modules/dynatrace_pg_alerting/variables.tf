variable "pg_alertings" {
  description = "Alerting rules for process groups based on instance count or other criteria."
  type = map(object({
    enabled                     = bool      # Whether alerting is enabled
    alerting_mode              = string    # Alerting strategy, e.g., 'ON_INSTANCE_COUNT_VIOLATION'
    minimum_instance_threshold = number    # Threshold to trigger the alert
    process_group              = string    # ID of the process group to monitor
  }))
  default = {
    alert1 = {
      enabled                     = true
      alerting_mode              = "ON_INSTANCE_COUNT_VIOLATION"
      minimum_instance_threshold = 5
      process_group              = "PROCESS_GROUP-1234567890000000"
    }
  }
}
