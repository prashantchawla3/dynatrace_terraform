resource "dynatrace_key_user_action" "key_user_action" {
  count          = length(var.key_user_actions)
  application_id = var.key_user_actions[count.index].application_id
  domain         = var.key_user_actions[count.index].domain
  name           = var.key_user_actions[count.index].name
  type           = var.key_user_actions[count.index].type
}
