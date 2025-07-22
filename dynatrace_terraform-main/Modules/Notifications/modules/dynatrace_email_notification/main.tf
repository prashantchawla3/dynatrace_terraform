resource "dynatrace_email_notification" "email" {
  active                 = var.email_active
  name                   = var.email_name
  profile                = dynatrace_alerting.Default.id
  subject                = var.email_subject
  to                     = var.email_to
  cc                     = var.email_cc
  bcc                    = var.email_bcc
  notify_closed_problems = var.email_notify_closed_problems
  body                   = var.email_body
}
