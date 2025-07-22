output "cloudapp_workloaddetection_ids" {
  value = [for k, v in dynatrace_cloudapp_workloaddetection.cloud_app_workload_detection : v.id]
}

output "declarative_grouping_names" {
  value = keys(dynatrace_declarative_grouping.this)
}

output "pg_alerting_ids" {
  value = [for k, v in dynatrace_pg_alerting.this : v.id]
}

output "pg_detection_ids" {
  value = [for k, v in dynatrace_process_group_detection.this : v.id]
}

output "pg_monitoring_ids" {
  value = [for k, v in dynatrace_process_group_monitoring.this : v.id]
}

output "pg_naming_ids" {
  value = [for k, v in dynatrace_processgroup_naming.this : v.id]
}
