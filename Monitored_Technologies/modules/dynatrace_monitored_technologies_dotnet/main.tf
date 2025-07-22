resource "dynatrace_monitored_technologies_dotnet" "this" {
  count                  = contains(keys(var.technologies), "dotnet") ? 1 : 0
  enabled                = var.technologies["dotnet"].enabled
  enabled_dot_net_core   = var.technologies["dotnet"].enabled_dot_net_core
  host_id                = var.technologies["dotnet"].host_id
}
