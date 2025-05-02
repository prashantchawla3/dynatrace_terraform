name               = "Example Alerting Profile"
description        = "Profile with custom rules and filters"
management_zone_id = "123456789012345678"   # example management zone ID

rules = [
  {
    severity_level          = "ERRORS"
    delay_in_minutes        = 15
    include_mode            = "INCLUDE_ANY"
    tag_filter_include_mode = "INCLUDE_ALL"
    tags                    = ["Service:A", "Team:Dev"]
  },
  {
    severity_level   = "PERFORMANCE"
    delay_in_minutes = 30
    include_mode     = "NONE"
  }
]

filters = [
  {
    type                       = "PREDEFINED"
    predefined_event_type      = "APPLICATION_ERROR_RATE_INCREASED"
    predefined_negate          = false
    custom_title_operator      = ""            # not used
    custom_title_value         = ""
    custom_title_negate        = false
    custom_title_enabled       = false
    custom_title_case_sensitive= false
    custom_description_operator = ""
    custom_description_value   = ""
    custom_description_negate  = false
    custom_description_enabled = false
    custom_description_case_sensitive = false
    custom_metadata = []
  },
  {
    type                          = "CUSTOM"
    predefined_event_type         = ""
    predefined_negate             = false
    custom_title_operator         = "CONTAINS"
    custom_title_value            = "Timeout"
    custom_title_negate           = false
    custom_title_enabled          = true
    custom_title_case_sensitive   = false
    custom_description_operator   = "CONTAINS"
    custom_description_value      = "Database"
    custom_description_negate     = false
    custom_description_enabled    = true
    custom_description_case_sensitive = false
    custom_metadata = [
      { key = "severity", value = "major", negate = false },
      { key = "retryCount", value = "3", negate = false }
    ]
  }
]

connectivity_alerts = {
  pg1 = {
    process_group_id = "abcdef1234567890"  # example process group ID
    enable           = true
  }
}

maintenance_windows = {
  mw1 = {
    enabled           = true
    name              = "Weekly Maintenance"
    description       = "Regular system maintenance on weekends"
    maintenance_type  = "PLANNED"
    suppression       = "DETECT_PROBLEMS_DONT_ALERT"
    disable_synthetic = true
    management_zones  = ["987654321098765432"]
    tags              = ["environment:staging"]
    entity_id         = ""
    schedule_type     = "WEEKLY"
    start_date        = "2025-01-01"
    end_date          = "2025-12-31"
    start_time        = "02:00"
    end_time          = "04:00"
    time_zone         = "UTC"
    days_of_week      = ["SATURDAY", "SUNDAY"]
    day_of_month      = null
  }
}
