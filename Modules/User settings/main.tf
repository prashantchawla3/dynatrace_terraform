
resource "dynatrace_user_settings" "example" {
  auto_language = var.auto_language
  auto_region   = var.auto_region
  auto_theme    = var.auto_theme
  auto_timezone = var.auto_timezone
  language      = var.language
  region        = var.region
  theme         = var.theme
  timezone      = var.timezone
  scope         = var.scope
}
