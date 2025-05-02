
terraform {
  required_providers {
    dynatrace = {
      source  = "dynatrace-oss/dynatrace"
      version = "~> 1.18.0"
    }
  }
}

provider "dynatrace" {
  environment_url = var.environment_url
  oauth {
    client_id     = var.dynatrace_client_id
    client_secret = var.dynatrace_client_secret
  }
}
