label                                = "Dynatrace AWS Credentials"
partition_type                       = "AWS_DEFAULT"
tagged_only                          = true
credentials_enabled                  = true
remove_defaults                      = true
running_on_dynatrace_infrastructure = false

authentication_data = {
  account_id = "123456789012"
  iam_role   = "DynatraceMonitoringRole"
  access_key = null
  secret_key = null
}

tags_to_monitor = [
  {
    name  = "Environment"
    value = "Production"
  },
  {
    name  = "Team"
    value = "DevOps"
  }
]

aws_services = {
  AmazonEC2 = {
    use_recommended_metrics = true
  },
  AmazonS3 = {
    use_recommended_metrics = true
  },
  AmazonRDS = {
    use_recommended_metrics = true
  }
}

azure_active                        = true
azure_app_id                        = "your-app-id"
azure_auto_tagging                  = true
azure_directory_id                  = "your-directory-id"
azure_label                         = "Azure Monitoring"
azure_key                           = "your-azure-key"
azure_monitor_only_tagged_entities = false
azure_remove_defaults               = true

azure_monitor_only_tag_pairs = [
  {
    name  = "env"
    value = "prod"
  }
]

azure_services = {
  "Azure Virtual Machines" = {
    use_recommended_metrics = true
  },
  "Azure App Service" = {
    use_recommended_metrics = true
  }
}

credentials_name     = "admin"
credentials_scopes = ["SYNTHETIC"]

credentials_username = "admin"
credentials_password = "yourpassword"



