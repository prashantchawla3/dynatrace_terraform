

resource "dynatrace_aws_credentials" "this" {
  label                              = var.label
  partition_type                    = var.partition_type
  tagged_only                       = var.tagged_only
  credentials_enabled               = var.credentials_enabled
  remove_defaults                   = var.remove_defaults
  running_on_dynatrace_infrastructure = var.running_on_dynatrace_infrastructure

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

resource "dynatrace_aws_service" "this" {
  for_each = var.aws_services
  credentials_id          = dynatrace_aws_credentials.this.id
  use_recommended_metrics = each.value.use_recommended_metrics
  name                    = each.key
}

resource "dynatrace_azure_credentials" "this" {
  active                        = var.azure_active
  app_id                        = var.azure_app_id
  auto_tagging                  = var.azure_auto_tagging
  directory_id                  = var.azure_directory_id
  label                         = var.azure_label
  key                           = var.azure_key
  monitor_only_tagged_entities = var.azure_monitor_only_tagged_entities
  remove_defaults               = var.azure_remove_defaults

  dynamic "monitor_only_tag_pairs" {
    for_each = var.azure_monitor_only_tag_pairs
    content {
      name  = monitor_only_tag_pairs.value.name
      value = monitor_only_tag_pairs.value.value
    }
  }
}

resource "dynatrace_azure_service" "this" {
  for_each = var.azure_services
  credentials_id          = dynatrace_azure_credentials.this.id
  use_recommended_metrics = each.value.use_recommended_metrics
  name                    = each.key
}

resource "dynatrace_credentials" "this" {
  name     = var.credentials_name
  scopes   = var.credentials_scopes
  username = var.credentials_username
  password = var.credentials_password
}
