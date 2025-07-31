output "trello_notification_id" {
  description = "The ID of the Trello notification configuration"
  value       = dynatrace_trello_notification.trello.id
}

output "trello_notification_name" {
  description = "The name of the Trello notification"
  value       = dynatrace_trello_notification.trello.name
}

output "trello_notification_active" {
  description = "Whether the Trello notification is active"
  value       = dynatrace_trello_notification.trello.active
}

output "trello_notification_board_id" {
  description = "The Trello board ID used for notifications"
  value       = dynatrace_trello_notification.trello.board_id
}

output "trello_notification_list_id" {
  description = "The Trello list ID where new cards are created"
  value       = dynatrace_trello_notification.trello.list_id
}

output "trello_notification_resolved_list_id" {
  description = "The Trello list ID where resolved cards are moved"
  value       = dynatrace_trello_notification.trello.resolved_list_id
}

output "trello_notification_text" {
  description = "The text content of the Trello notification"
  value       = dynatrace_trello_notification.trello.text
}

output "trello_notification_description" {
  description = "The description content of the Trello notification"
  value       = dynatrace_trello_notification.trello.description
}
