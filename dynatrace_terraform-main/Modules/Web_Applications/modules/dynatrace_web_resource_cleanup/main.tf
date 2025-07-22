resource "dynatrace_web_app_resource_cleanup" "web_app_resource_cleanup" {
  count              = length(var.web_app_resource_cleanups)
  name               = var.web_app_resource_cleanups[count.index].name
  regular_expression = var.web_app_resource_cleanups[count.index].regular_expression
  replace_with       = var.web_app_resource_cleanups[count.index].replace_with
  insert_after       = var.web_app_resource_cleanups[count.index].insert_after
}
