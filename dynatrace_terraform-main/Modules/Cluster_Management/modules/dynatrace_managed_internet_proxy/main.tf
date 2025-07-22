resource "dynatrace_managed_internet_proxy" "this" {
  scheme           = var.proxy_scheme
  server           = var.proxy_server
  port             = var.proxy_port
  user             = var.proxy_user
  password         = var.proxy_password
  non_proxy_hosts  = var.proxy_non_proxy_hosts
}
