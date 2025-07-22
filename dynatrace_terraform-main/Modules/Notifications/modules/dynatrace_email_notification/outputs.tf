output "email_active" {
  description = "Indicates whether the email notification is active"
  value       = var.email_active
}

output "email_name" {
  description = "Name of the email notification"
  value       = var.email_name
}

output "email_subject" {
  description = "Subject line of the email notification"
  value       = var.email_subject
}

output "email_to" {
  description = "List of primary recipients for the email notification"
  value       = var.email_to
}

output "email_cc" {
  description = "List of CC recipients for the email notification"
  value       = var.email_cc
}

output "email_bcc" {
  description = "List of BCC recipients for the email notification"
  value       = var.email_bcc
}

output "email_notify_closed_problems" {
  description = "Indicates whether to notify about closed problems"
  value       = var.email_notify_closed_problems
}

output "email_body" {
  description = "Body content of the email notification"
  value       = var.email_body
}
