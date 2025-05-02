resource "dynatrace_json_dashboard" "this" {
  count = length(var.dashboards)

  name           = var.dashboards[count.index].name
  description    = var.dashboards[count.index].description
  dashboard_id   = var.dashboards[count.index].dashboard_id
  layout_type    = var.dashboards[count.index].layout_type
  sharing        = var.dashboards[count.index].sharing
  management_zone = var.dashboards[count.index].management_zone

  widgets {
    count = length(var.dashboards[count.index].widgets)

    name      = var.dashboards[count.index].widgets[count.index].name
    type      = var.dashboards[count.index].widgets[count.index].type
    size      = var.dashboards[count.index].widgets[count.index].size
    position  = var.dashboards[count.index].widgets[count.index].position
    settings  = var.dashboards[count.index].widgets[count.index].settings
  }
}
