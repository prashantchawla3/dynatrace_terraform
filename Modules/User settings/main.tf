resource "dynatrace_user_settings" "example" {
  auto_language = var.auto_language
  auto_region   = var.auto_region
  auto_theme    = var.auto_theme
  auto_timezone = var.auto_timezone
  scope         = var.scope
  #language      = var.language
  region        = var.region
  #theme         = var.theme
  timezone      = var.timezone
}