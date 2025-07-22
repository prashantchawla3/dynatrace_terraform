output "dynatrace_web_app_request_errors_ids" {
  value = [for error in dynatrace_web_app_request_errors.web_app_request_errors : error.id]
}