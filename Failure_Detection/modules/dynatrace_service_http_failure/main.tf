resource "dynatrace_service_http_failure" "this" {
  count      = var.service_http_failure_enabled ? 1 : 0
  enabled    = var.service_http_failure_enabled
  service_id = var.service_id

  broken_links {
    broken_link_domains         = var.broken_link_domains
    http_404_not_found_failures = var.http_404_not_found_failures
  }

  http_response_codes {
    client_side_errors                        = var.client_side_errors
    fail_on_missing_response_code_client_side = var.fail_on_missing_response_code_client_side
    fail_on_missing_response_code_server_side = var.fail_on_missing_response_code_server_side
    server_side_errors                        = var.server_side_errors
  }
}
