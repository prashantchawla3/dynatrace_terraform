resource "dynatrace_iam_user" "iam_user" {
  email  = var.iam_user_email
  groups = var.iam_user_groups
}
