resource "dynatrace_custom_units" "example" {
  name        = var.custom_units_name
  description = var.custom_units_description
  plural_name = var.custom_units_plural_name
  symbol      = var.custom_units_symbol
}
