resource "dynatrace_muted_requests" "example" {
  service_id          = var.service_id
  muted_request_names = var.muted_request_names
}