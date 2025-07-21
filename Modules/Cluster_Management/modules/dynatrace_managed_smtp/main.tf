resource "dynatrace_managed_smtp" "this" {
  host_name                         = var.smtp_host_name
  port                              = var.smtp_port
  user_name                         = var.smtp_user_name
  password                          = var.smtp_password
  is_password_configured            = var.smtp_is_password_configured
  connection_security               = var.smtp_connection_security
  sender_email_address              = var.smtp_sender_email_address
  allow_fallback_via_mission_control = var.smtp_allow_fallback_via_mission_control
  use_smtp_server                   = var.smtp_use_smtp_server
}
