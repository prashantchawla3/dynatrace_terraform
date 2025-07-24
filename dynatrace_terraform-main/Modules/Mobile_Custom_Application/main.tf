
module "mobile_applications" {
  source              = "./modules/dynatrace-mobile_application"
  mobile_applications = var.mobile_applications
}

module "calculated_mobile_metrics" {
  source                    = "./modules/dynatrace_calculated_mobile_metric"
  calculated_mobile_metrics = var.calculated_mobile_metrics
}

module "custom_app_enablements" {
  source                  = "./modules/dynatrace_custom_app_enablement"
  custom_app_enablements = var.custom_app_enablements
}

module "mobile_app_key_performance" {
  source                      = "./modules/dynatrace_mobile_app_key_performance"
  mobile_app_key_performance = var.mobile_app_key_performance
}


module "mobile_app_request_errors" {
  source                      = "./modules/dynatrace_mobile_app_request_errors"
  mobile_app_request_errors   = var.mobile_app_request_errors
}
