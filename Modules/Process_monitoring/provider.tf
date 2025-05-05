terraform {
  required_providers {
    dynatrace = {
      source  = "dynatrace-oss/dynatrace"
      version = "~> 1.0"
    }
  }
}

provider "dynatrace" {
  api_url   = var.dynatrace_api_url
  api_token = var.dynatrace_api_token
}