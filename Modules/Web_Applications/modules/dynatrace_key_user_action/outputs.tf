output "dynatrace_key_user_action_ids" {
  value = [for action in dynatrace_key_user_action.key_user_action : action.id]
}
