resource "dynatrace_appsec_notification" "webhook" {
  count = length(var.notifications)

  type                                    = var.notifications[count.index].type
  enabled                                 = var.notifications[count.index].enabled
  display_name                            = var.notifications[count.index].display_name
  security_problem_based_alerting_profile = var.notifications[count.index].alerting_profile
  trigger                                 = var.notifications[count.index].trigger

  security_problem_based_webhook_payload {
    payload = var.notifications[count.index].payload
  }

  webhook_configuration {
    accept_any_certificate = var.notifications[count.index].accept_any_certificate
    url                    = var.notifications[count.index].url
  }
}