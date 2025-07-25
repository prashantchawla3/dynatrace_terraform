alerting_name        = "example-alerting-profile"
management_zone      = "ExampleZone"

rules = [
  {
    include_mode     = "INCLUDE_ALL"
    tags             = ["EnvironmentA:production", "Team:test"]
    delay_in_minutes = 0
    severity_level   = "AVAILABILITY"
  },
  {
    include_mode     = "INCLUDE_ALL"
    tags             = ["EnvironmentB:production", "Team:test"]
    delay_in_minutes = 0
    severity_level   = "CUSTOM_ALERT"
  },
  {
    include_mode     = "INCLUDE_ALL"
    tags             = ["EnvironmentC:production", "Team:test"]
    delay_in_minutes = 0
    severity_level   = "ERRORS"
  },
  {
    include_mode     = "INCLUDE_ALL"
    tags             = ["EnvironmentD:production", "Team:test"]
    delay_in_minutes = 0
    severity_level   = "MONITORING_UNAVAILABLE"
  },
  {
    include_mode     = "INCLUDE_ALL"
    tags             = ["EnvironmentE:production", "Team:test"]
    delay_in_minutes = 0
    severity_level   = "PERFORMANCE"
  },
  {
    include_mode     = "INCLUDE_ALL"
    tags             = ["EnvironmentF:production", "Team:test"]
    delay_in_minutes = 0
    severity_level   = "RESOURCE_CONTENTION"
  }
]

enable_connectivity_alerts = true
connectivity_alerts        = true
process_group_id           = "PROCESS_GROUP-1234567890000000"

maintenance_enabled            = true
maintenance_name               = "example-maintenance-window"
maintenance_description        = "Terraform test execution"
maintenance_type               = "PLANNED"
maintenance_disable_synthetic = true
maintenance_suppression        = "DETECT_PROBLEMS_AND_ALERT"

schedule_type                     = "WEEKLY"
weekly_recurrence_day_of_week    = "MONDAY"
recurrence_range_end_date        = "2022-10-06"
recurrence_range_start_date      = "2022-10-05"
time_window_end_time             = "15:13:00"
time_window_start_time           = "14:13:00"
time_window_time_zone            = "UTC"

filters = [
  {
    entity_type = "HOST"
    entity_tags = ["KeyTest:ValueTest"]
  }
]
