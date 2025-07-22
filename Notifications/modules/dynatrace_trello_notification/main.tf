resource "dynatrace_trello_notification" "trello" {
  active              = var.trello_active
  name                = var.trello_name
  profile             = dynatrace_alerting.Default.id
  application_key     = var.trello_application_key
  board_id            = var.trello_board_id
  list_id             = var.trello_list_id
  resolved_list_id    = var.trello_resolved_list_id
  text                = var.trello_text
  description         = var.trello_description
  authorization_token = var.trello_authorization_token
}
