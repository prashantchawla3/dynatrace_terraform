resource "dynatrace_pager_duty_notification" "pager_duty" {
  active  = var.pager_duty_active
  name    = var.pager_duty_name
  profile = dynatrace_alerting.Default.id
  account = var.pager_duty_account
  service = var.pager_duty_service
  api_key = var.pager_duty_api_key
}
