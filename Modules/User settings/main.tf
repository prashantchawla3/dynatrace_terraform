module "user_settings" {
  source         = "./modules/dynatrace_user_settings"
  user_settings  = var.user_settings
}
