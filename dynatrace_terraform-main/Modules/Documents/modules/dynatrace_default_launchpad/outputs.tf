output "launchpad_statuses" {
  value = { for k, v in dynatrace_default_launchpad.this : k => v.group_launchpads }
}