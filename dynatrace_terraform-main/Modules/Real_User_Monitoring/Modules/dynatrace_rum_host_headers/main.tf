resource "dynatrace_rum_host_headers" "this" {
  for_each = var.rum_host_headers
  header_name = each.value.header_name
}
