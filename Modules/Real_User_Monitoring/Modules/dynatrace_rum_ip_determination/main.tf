resource "dynatrace_rum_ip_determination" "this" {
  for_each = var.rum_ip_determination
  header_name = each.value.header_name
}
