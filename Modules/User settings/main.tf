
resource "dynatrace_user_settings" "example" {
  auto_language = var.auto_language
  auto_region   = var.auto_region
  auto_theme    = var.auto_theme
  auto_timezone = var.auto_timezone
  scope         = var.scope
  region        = var.region
  timezone      = var.timezone
}
