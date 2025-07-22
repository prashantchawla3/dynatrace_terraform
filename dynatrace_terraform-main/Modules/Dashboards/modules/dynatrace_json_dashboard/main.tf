resource "dynatrace_json_dashboard" "this" {
  count    = length(var.json_dashboards)
  contents = jsonencode(var.json_dashboards[count.index])
}
