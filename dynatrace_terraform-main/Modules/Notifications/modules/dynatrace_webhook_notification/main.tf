resource "dynatrace_webhook_notification" "webhook" {
  active                 = var.webhook_active
  name                   = var.webhook_name
  profile                = dynatrace_alerting.Default.id
  url                    = var.webhook_url
  insecure               = var.webhook_insecure
  notify_event_merges    = var.webhook_notify_event_merges
  notify_closed_problems = var.webhook_notify_closed_problems
  payload                = var.webhook_payload
  headers {
    header {
      name  = var.webhook_header_name_01
      value = var.webhook_header_value_01
    }
    header {
      name         = var.webhook_header_name_02
      secret_value = var.webhook_header_value_02
    }
  }
  use_oauth_2 = var.webhook_use_oauth_2
  oauth_2_credentials {
    access_token_url = var.webhook_access_token_url
    client_id        = var.webhook_client_id
    client_secret    = var.webhook_client_secret
  }
}
