variable "user_experience_score" {
  description = "Defines thresholds and conditions to compute user experience scores."
  type = map(object({
    consider_last_action                   = bool
    consider_rage_click                    = bool
    max_frustrated_user_actions_threshold = number
    min_satisfied_user_actions_threshold  = number
  }))
  default = {
    ues1 = {
      consider_last_action                   = false
      consider_rage_click                    = false
      max_frustrated_user_actions_threshold = 20
      min_satisfied_user_actions_threshold  = 60
    }
  }
}
