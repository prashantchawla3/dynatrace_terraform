resource "dynatrace_session_replay_resource_capture" "this" {
  application_id                              = var.application_id
  enable_resource_capturing                   = var.enable_resource_capturing
  resource_capture_url_exclusion_pattern_list = var.resource_capture_url_exclusion_pattern_list
}
