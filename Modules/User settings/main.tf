resource "dynatrace_user_settings" "this" {
  for_each       = var.user_settings
  auto_language  = each.value.auto_language
  auto_region    = each.value.auto_region
  auto_theme     = each.value.auto_theme
  auto_timezone  = each.value.auto_timezone
  language       = each.value.language
  region         = each.value.region
  theme          = each.value.theme
  timezone       = each.value.timezone
  scope          = each.value.scope
}
