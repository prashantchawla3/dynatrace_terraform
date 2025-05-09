name = "Example Alerting Profile"

rules = [
  {
    severity_level   = "ERRORS"
    delay_in_minutes = 15
    include_mode     = "INCLUDE_ANY"
    tags             = ["Service:A", "Team:Dev"]
  },
  {
    severity_level   = "PERFORMANCE"
    delay_in_minutes = 30
    include_mode     = "NONE"
  }
]

maintenance_windows = {
  mw1 = {
    name             = "Weekly Maintenance"
    maintenance_type = "PLANNED"
    suppression      = "DETECT_PROBLEMS_DONT_ALERT"
    schedule_type    = "WEEKLY"
    start_time       = "02:00"
    end_time         = "04:00"
    time_zone        = "UTC"
  }
}
