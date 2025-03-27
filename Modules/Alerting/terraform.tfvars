# Alerting Profile Variables
alerting_name            = "example_alerting_profile"
alerting_management_zone = ""

alerting_rule_1_tags             = ["EnvironmentA:production", "Team:test"]
alerting_rule_1_delay_in_minutes = 0
alerting_rule_1_severity_level   = "AVAILABILITY"

alerting_rule_2_tags             = ["EnvironmentB:production", "Team:test"]
alerting_rule_2_delay_in_minutes = 0
alerting_rule_2_severity_level   = "CUSTOM_ALERT"

alerting_rule_3_tags             = ["EnvironmentC:production", "Team:test"]
alerting_rule_3_delay_in_minutes = 0
alerting_rule_3_severity_level   = "ERRORS"

alerting_rule_4_tags             = ["EnvironmentD:production", "Team:test"]
alerting_rule_4_delay_in_minutes = 0
alerting_rule_4_severity_level   = "MONITORING_UNAVAILABLE"

alerting_rule_5_tags             = ["EnvironmentE:production", "Team:test"]
alerting_rule_5_delay_in_minutes = 0
alerting_rule_5_severity_level   = "PERFORMANCE"

alerting_rule_6_tags             = ["EnvironmentF:production", "Team:test"]
alerting_rule_6_delay_in_minutes = 0
alerting_rule_6_severity_level   = "RESOURCE_CONTENTION"

# Connectivity Alerts Variables
connectivity_alerts = false
process_group_id    = "PROCESS_GROUP-1234567890000000"

# Maintenance Window Variables
maintenance_enabled            = true
maintenance_name               = "example_maintenance_window"
maintenance_description        = "Terraform test execution"
maintenance_type               = "PLANNED"
maintenance_disable_synthetic  = true
maintenance_suppression        = "DETECT_PROBLEMS_AND_ALERT"
maintenance_schedule_type      = "WEEKLY"
maintenance_weekly_day_of_week = "MONDAY"
maintenance_weekly_end_date    = "2022-10-06"
maintenance_weekly_start_date  = "2022-10-05"