resource "dynatrace_aws_credentials" "aws_credentials" {
  label          = var.aws_label
  partition_type = var.aws_partition_type
  tagged_only    = var.aws_tagged_only
  authentication_data {
    account_id = var.aws_account_id
    iam_role   = var.aws_iam_role
  }
  remove_defaults = var.aws_remove_defaults
}

resource "dynatrace_aws_service" "aws_service" {
  for_each = var.aws_services
  credentials_id          = dynatrace_aws_credentials.aws_credentials.id
  use_recommended_metrics = each.value.use_recommended_metrics
  name                    = each.key
}

resource "dynatrace_azure_credentials" "azure_credentials" {
  active                       = var.azure_active
  app_id                       = var.azure_app_id
  auto_tagging                 = var.azure_auto_tagging
  directory_id                 = var.azure_directory_id
  label                        = var.azure_label
  key                          = var.azure_key
  monitor_only_tagged_entities = var.azure_monitor_only_tagged_entities
  remove_defaults              = var.azure_remove_defaults

  dynamic "monitor_only_tag_pairs" {
    for_each = var.azure_monitor_only_tag_pairs
    content {
      name  = monitor_only_tag_pairs.value.name
      value = monitor_only_tag_pairs.value.value
    }
  }
}

resource "dynatrace_azure_service" "azure_service" {
  for_each = var.azure_services
  credentials_id          = dynatrace_azure_credentials.azure_credentials.id
  use_recommended_metrics = each.value.use_recommended_metrics
  name                    = each.key
}

resource "dynatrace_credentials" "credentials" {
  name     = var.credentials_name
  scopes   = var.credentials_scopes
  username = var.credentials_username
  password = var.credentials_password
}
