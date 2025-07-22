module "geolocation" {
  source     = "./Modules/dynatrace_geolocation"
  geolocation = var.geolocation
}

module "process_group_rum" {
  source            = "./Modules/dynatrace_process_group_rum"
  process_group_rum = var.process_group_rum
}

module "rum_advanced_correlation" {
  source                  = "./Modules/dynatrace_rum_advanced_correlation"
  rum_advanced_correlation = var.rum_advanced_correlation
}

module "rum_host_headers" {
  source           = "./Modules/dynatrace_rum_host_headers"
  rum_host_headers = var.rum_host_headers
}

module "rum_ip_determination" {
  source               = "./Modules/dynatrace_rum_ip_determination"
  rum_ip_determination = var.rum_ip_determination
}

module "rum_ip_locations" {
  source           = "./Modules/dynatrace_rum_ip_locations"
  rum_ip_locations = var.rum_ip_locations
}

module "rum_overload_prevention" {
  source                  = "./Modules/dynatrace_rum_overload_prevention"
  rum_overload_prevention = var.rum_overload_prevention
}

module "rum_provider_breakdown" {
  source                = "./Modules/dynatrace_rum_provider_breakdown"
  rum_provider_breakdown = var.rum_provider_breakdown
}

module "usability_analytics" {
  source             = "./Modules/dynatrace_usability_analytics"
  usability_analytics = var.usability_analytics
}

module "user_action_metrics" {
  source             = "./Modules/dynatrace_user_action_metrics"
  user_action_metrics = var.user_action_metrics
}

module "user_experience_score" {
  source                = "./Modules/dynatrace_user_experience_score"
  user_experience_score = var.user_experience_score
}

module "user_session_metrics" {
  source              = "./Modules/dynatrace_user_session_metrics"
  user_session_metrics = var.user_session_metrics
}
