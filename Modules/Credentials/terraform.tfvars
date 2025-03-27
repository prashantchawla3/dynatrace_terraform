aws_label = "your-aws-label"
aws_partition_type = "AWS_DEFAULT"
aws_tagged_only = false
aws_account_id = "your-aws-account-id"
aws_iam_role = "your-aws-iam-role"
aws_remove_defaults = true
aws_services = {
  "service1" = {
    use_recommended_metrics = true
  },
  "service2" = {
    use_recommended_metrics = true
  }
}

azure_active = true
azure_app_id = "your-azure-app-id"
azure_auto_tagging = true
azure_directory_id = "your-azure-directory-id"
azure_label = "your-azure-label"
azure_key = "your-azure-key"
azure_monitor_only_tagged_entities = true
azure_monitor_only_tag_pairs = [
  {
    name  = "tag1"
    value = "value1"
  },
  {
    name  = "tag2"
    value = "value2"
  }
]
azure_remove_defaults = true
azure_services = {
  "service1" = {
    use_recommended_metrics = true
  },
  "service2" = {
    use_recommended_metrics = true
  }
}

credentials_name = "your-credentials-name"
credentials_scopes = ["SYNTHETIC"]
credentials_username = "your-credentials-username"
credentials_password = "your-credentials-password"
