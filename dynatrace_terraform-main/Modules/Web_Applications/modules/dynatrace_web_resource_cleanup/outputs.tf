output "dynatrace_web_app_resource_cleanup_ids" {
  value = [for cleanup in dynatrace_web_app_resource_cleanup.web_app_resource_cleanup : cleanup.id]
}
