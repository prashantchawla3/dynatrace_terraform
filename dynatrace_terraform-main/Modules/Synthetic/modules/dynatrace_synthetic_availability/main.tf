resource "dynatrace_synthetic_availability" "example" {
  count                       = var.enable_synthetic_availability ? 1 : 0
  exclude_maintenance_windows = var.synthetic_availability_exclude_maintenance_windows
}
