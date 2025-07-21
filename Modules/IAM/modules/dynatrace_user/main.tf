resource "dynatrace_user" "user" {
  email      = var.user_email
  first_name = var.user_first_name
  last_name  = var.user_last_name
  user_name  = var.user_user_name
  groups     = var.user_groups
}
