resource "dynatrace_process_group_rum" "this" {
  for_each = var.process_group_rum
  enable           = each.value.enable
  process_group_id = each.value.process_group_id
}