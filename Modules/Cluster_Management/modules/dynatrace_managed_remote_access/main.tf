resource "dynatrace_managed_remote_access" "this" {
  user_id        = var.remote_access_user_id
  reason         = var.remote_access_reason
  requested_days = var.remote_access_requested_days
  role           = var.remote_access_role
}
