resource "dynatrace_aws_credentials" "this" {
  label                                = var.label
  partition_type                       = var.partition_type
  tagged_only                          = var.tagged_only
  credentials_enabled                  = var.credentials_enabled
  remove_defaults                      = var.remove_defaults
  running_on_dynatrace_infrastructure  = var.running_on_dynatrace_infrastructure

  authentication_data {
    account_id = var.authentication_data.account_id
    iam_role   = var.authentication_data.iam_role
    access_key = lookup(var.authentication_data, "access_key", null)
    secret_key = lookup(var.authentication_data, "secret_key", null)
  }

  dynamic "tags_to_monitor" {
    for_each = var.tagged_only ? var.tags_to_monitor : []
    content {
      name  = tags_to_monitor.value.name
      value = tags_to_monitor.value.value
    }
  }
}
