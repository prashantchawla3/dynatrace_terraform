host_group_id                         = "environment"
aspnetcore                            = false
cf_appsmanagerjs                      = false
container                             = false
docker_pauseamd64                     = false
exe_bbs                               = false
exe_caddy                             = false
exe_schedular                         = false
exe_silkdaemon                        = false
go_static                             = false
node_nodegyp                          = false

process_availability_enabled          = true
process_availability_name             = "Process Availability Rule"
process_availability_rule_property    = "executable"
process_availability_rule_condition   = "$contains(svc)"
process_availability_metadata_key     = "foo"
process_availability_metadata_value   = "bar"

process_monitoring_host_group_id      = "HOST_GROUP-0000000000000000"
process_monitoring_auto_monitoring    = true

process_monitoring_rule_enabled       = true
process_monitoring_rule_mode          = "MONITORING_OFF"
process_monitoring_rule_host_group_id = "HOST_GROUP-0000000000000000"
process_monitoring_rule_condition_item = "APACHE_CONFIG_PATH"
process_monitoring_rule_condition_operator = "STARTS"
process_monitoring_rule_condition_value = "foo-bar-x"

process_visibility_enabled            = true
process_visibility_max_processes      = 80
process_visibility_scope              = "environment"
