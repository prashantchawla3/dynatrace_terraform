resource "dynatrace_builtin_process_monitoring" "builtin_process_monitoring" {
  host_group_id       = var.host_group_id
  aspnetcore          = var.aspnetcore
  cf_appsmanagerjs    = var.cf_appsmanagerjs
  container           = var.container
  docker_pauseamd64   = var.docker_pauseamd64
  exe_bbs             = var.exe_bbs
  exe_caddy           = var.exe_caddy
  exe_schedular       = var.exe_schedular
  exe_silkdaemon      = var.exe_silkdaemon
  go_static           = var.go_static
  node_nodegyp        = var.node_nodegyp
}