output "iam_group_id" {
  value = dynatrace_iam_group.iam_group.id
}

output "iam_user_id" {
  value = dynatrace_iam_user.iam_user.id
}

output "iam_policy_id" {
  value = dynatrace_iam_policy.iam_policy.id
}

output "iam_permission_id" {
  value = dynatrace_iam_permission.iam_permission.id
}

output "user_group_id" {
  value = dynatrace_user_group.user_group.id
}
