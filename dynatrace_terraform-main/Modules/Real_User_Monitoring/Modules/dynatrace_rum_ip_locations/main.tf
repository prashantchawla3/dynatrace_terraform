resource "dynatrace_rum_ip_locations" "this" {
  for_each = var.rum_ip_locations
  country_code = each.value.country_code
  ip           = each.value.ip
  ip_to        = each.value.ip_to
  region_code  = each.value.region_code
}
