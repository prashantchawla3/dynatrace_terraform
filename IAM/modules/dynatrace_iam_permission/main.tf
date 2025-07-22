resource "dynatrace_iam_permission" "iam_permission" {
  name    = "account-user-management"
  group   = var.iam_permission_group
  account = var.iam_permission_account
}
