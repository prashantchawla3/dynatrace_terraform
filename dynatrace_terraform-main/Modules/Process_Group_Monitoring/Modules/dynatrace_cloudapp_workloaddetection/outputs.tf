output "cloudapp_workloaddetection_ids" {
  value = [for k, v in dynatrace_cloudapp_workloaddetection.cloud_app_workload_detection : v.id]
}