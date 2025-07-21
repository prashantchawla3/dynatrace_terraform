resource "dynatrace_user_experience_score" "this" {
  for_each = var.user_experience_score
  consider_last_action                   = each.value.consider_last_action
  consider_rage_click                    = each.value.consider_rage_click
  max_frustrated_user_actions_threshold = each.value.max_frustrated_user_actions_threshold
  min_satisfied_user_actions_threshold  = each.value.min_satisfied_user_actions_threshold
}