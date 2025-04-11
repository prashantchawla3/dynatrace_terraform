
zone_name        = "example_zone"
zone_description = "This is an example management zone"
zone_legacy_id   = "legacy-id-example"
entity_selector  = "type(\"HOST\")"

# Alerting Profile Variables
alerting_name                    = "example_alerting_profile"
alerting_management_zone         = "example_zone" # Reference the management zone created
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
maintenance_suppression        = true
maintenance_schedule_type      = "WEEKLY"
maintenance_weekly_day_of_week = "MONDAY"
maintenance_weekly_end_date    = "2022-10-06"
maintenance_weekly_start_date  = "2022-10-05"
maintenance_weekly_end_time    = "15:13:00"
maintenance_weekly_start_time  = "14:13:00"
maintenance_weekly_time_zone   = "UTC"
maintenance_filter_entity_type = "HOST"
maintenance_filter_entity_tags = ["KeyTest:ValueTest"]

# Dashboard Variables
dashboard_name   = "Example Dashboard"
dashboard_shared = true
dashboard_owner  = "Dynatrace"
dashboard_tags   = ["Example"]
dashboard_preset = false
metric_name      = "ext:cloud.azure.microsoft_cognitiveservices.accounts.successfulcalls"

# Autotag Variables
autotag_name = "example_autotag_name"

# Additional Variables
generic_relationships_enabled             = true
generic_relationships_created_by          = "Terraform"
generic_relationships_from_role           = "terraformrole"
generic_relationships_from_type           = "os:service"
generic_relationships_to_role             = "terraformrole"
generic_relationships_to_type             = "terraformdestination"
generic_relationships_type_of_relation    = "PART_OF"
generic_relationships_sources_condition   = "$eq(terraform)"
generic_relationships_sources_source_type = "Metrics"

generic_types_name                          = "terraform:type"
generic_types_enabled                       = true
generic_types_created_by                    = "Terraform"
generic_types_display_name                  = "TerraformTest"
generic_types_rules_icon_pattern            = "{TerraformIcon}"
generic_types_rules_id_pattern              = "{TerraformPlaceholder}"
generic_types_rules_instance_name_pattern   = "{TerraformInstance}"
generic_types_rules_attributes_key          = "TerraformAttribute"
generic_types_rules_attributes_pattern      = "{TerraformExtraction}"
generic_types_rules_required_dimensions_key = "TerraformDimension"
generic_types_rules_sources_condition       = "$eq(TerraformCondition)"
generic_types_rules_sources_source_type     = "Events"

grail_security_context_entity_type          = "exampletype"
grail_security_context_destination_property = "exampleproperty"

auto_update           = true
scope_activegate      = "environment"
scope_oneagent        = "environment"
target_version        = "latest"
update_mode           = "AUTOMATIC"
name                  = "example_update"
enabled               = true
recurrence            = "ONCE"
once_recurrence_end   = "2023-12-31T23:59:59Z"
once_recurrence_start = "2023-01-01T00:00:00Z"

slo_name                        = "example_slo"
slo_enabled                     = true
slo_description                 = "Terraform Test"
slo_evaluation_type             = "AGGREGATE"
slo_evaluation_window           = "-1w"
slo_filter                      = "type(SERVICE),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE)"
slo_metric_expression           = "100*(builtin:service.requestCount.server:splitBy())/(builtin:service.requestCount.server:splitBy())"
slo_metric_name                 = "terraform_test"
slo_target_success              = 95
slo_target_warning              = 98
slo_legacy_id                   = ""
burn_rate_visualization_enabled = false
fast_burn_threshold             = null


enable_copilot                  = true
enable_tenant_aware_data_mining = true
blocklist_name                  = "example-blocklist"
blocklist_type                  = "BUCKET"

custom_units_name        = "example_unit"
custom_units_description = "Created by Terraform"
custom_units_plural_name = "TerraformUnits"
custom_units_symbol      = "T/u"

histogram_metrics_enable_histogram_bucket_ingest = false

metric_metadata_display_name = "example_metric"
metric_metadata_metric_id    = "metric-func:slo.terraform-test"
metric_metadata_unit         = "percent"

metric_query_metric_id       = "metric-func:slo.terraform-test"
metric_query_metric_selector = "((100*(builtin:service.requestCount.server:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),mzId(0000000000000000000),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE)\"))):splitBy())/(builtin:service.requestCount.server:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),mzId(0000000000000000000),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE)\"))):splitBy())) - (95.0))"

host_group_id     = "environment"
aspnetcore        = false
cf_appsmanagerjs  = false
container         = false
docker_pauseamd64 = false
exe_bbs           = false
exe_caddy         = false
exe_schedular     = false
exe_silkdaemon    = false
go_static         = false
node_nodegyp      = false

process_availability_enabled        = true
process_availability_name           = "Process Availability Rule"
process_availability_rule_property  = "executable"
process_availability_rule_condition = "$contains(svc)"
process_availability_metadata_key   = "foo"
process_availability_metadata_value = "bar"

process_monitoring_host_group_id   = "HOST_GROUP-0000000000000000"
process_monitoring_auto_monitoring = true

process_monitoring_rule_enabled            = true
process_monitoring_rule_mode               = "MONITORING_OFF"
process_monitoring_rule_host_group_id      = "HOST_GROUP-0000000000000000"
process_monitoring_rule_condition_item     = "APACHE_CONFIG_PATH"
process_monitoring_rule_condition_operator = "STARTS"
process_monitoring_rule_condition_value    = "foo-bar-x"

process_visibility_enabled       = true
process_visibility_max_processes = 80
process_visibility_scope         = "environment"

team_name                       = "example_team"
team_description                = "Created by Terraform"
team_identifier                 = "Terraform"
team_external_id                = "external-id-example"
responsibility_development      = true
responsibility_infrastructure   = false
responsibility_line_of_business = false
responsibility_operations       = true
responsibility_security         = false
additional_info_key             = "HashiCorp"
additional_info_value           = "Terraform"
additional_info_url             = "https://www.terraform.io/"
contact_integration_type        = "JIRA"
contact_jira_default_assignee   = "example_assignee"
contact_jira_project            = "example_project"
contact_ms_teams                = "example_team@teams.microsoft.com"
contact_slack_channel           = "#example_team_channel"
contact_url                     = "https://www.example.com/contact"
link_type                       = "URL"
link_url                        = "https://www.google.com"
supplementary_identifier        = "supplementary-id-example"

enabled_vmware = false
ipaddress      = "vcenter01"
label          = "example"
password       = "your-password-here"
username       = "terraform"
filter         = "$contains(Terraform)"

application_id                                    = "environment"
enable_resource_capturing                         = true
resource_capture_url_exclusion_pattern_list       = ["www.google.com"]
enable_opt_in_mode                                = false
url_exclusion_pattern_list                        = ["www.google.com"]
playback_masking_preset                           = "MASK_ALL"
recording_masking_preset                          = "ALLOW_LIST"
recording_masking_allow_list_rules_css_expression = "selector.example"
recording_masking_allow_list_rules_target         = "ELEMENT"
