resource "dynatrace_key_requests" "example" {
  service         = var.service_id
  key_request_ids = var.key_request_ids
  names           = var.key_request_names
}
