resource "dynatrace_iam_group" "iam_group" {
  name = var.iam_group_name

  permissions {
    permission {
      name  = "account-user-management"
      type  = "account"
      scope = var.iam_group_permission_scope
    }
  }
}
