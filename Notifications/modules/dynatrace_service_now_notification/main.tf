resource "dynatrace_service_now_notification" "service_now" {
  active    = var.service_now_active
  name      = var.service_now_name
  profile   = dynatrace_alerting.Default.id
  instance  = var.service_now_instance
  username  = var.service_now_username
  password  = var.service_now_password
  message   = var.service_now_message
  incidents = var.service_now_incidents
  events    = var.service_now_events
}
