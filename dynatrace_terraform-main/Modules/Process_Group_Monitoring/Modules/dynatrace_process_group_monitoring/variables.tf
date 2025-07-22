variable "pg_monitorings" {
  description = "Defines monitoring state for process groups (e.g., ON, OFF)."
  type = map(object({
    monitoring_state = string    # MONITORING_ON, MONITORING_OFF, etc.
    process_group_id = string    # Process group to apply the monitoring state to
  }))
  default = {
    monitor1 = {
      monitoring_state = "MONITORING_ON"
      process_group_id = "PROCESS_GROUP-1234567890000000"
    }
  }
}
