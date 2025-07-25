
module "os_services" {
  source      = "./modules/dynatrace_os_services"
  os_services = var.os_services
}

module "aix_extension" {
  source         = "./modules/dynatrace_aix_extension"
  aix_extensions = var.aix_extensions
}

module "crashdump_analytics" {
  source              = "./modules/dynatrace_crashdump_analytics"
  crashdump_analytics = var.crashdump_analytics
}

module "disk_analytics" {
  source         = "./modules/dynatrace_disk_analytics"
  disk_analytics = var.disk_analytics
}


module "host_monitoring" {
  source          = "./modules/dynatrace_host_monitoring"
  host_monitoring = var.host_monitoring
}

module "host_monitoring_advanced" {
  source                   = "./modules/dynatrace_host_monitoring_advanced"
  host_monitoring_advanced = var.host_monitoring_advanced
}

module "host_monitoring_modes" {
  source               = "./modules/dynatrace_host_monitoring_mode"
  host_monitoring_modes = var.host_monitoring_modes
}


module "host_naming" {
  source      = "./modules/dynatrace_host_naming"
  host_naming = var.host_naming
}

module "host_process_group_monitoring" {
  source                         = "./modules/dynatrace_host_process_group_monitoring"
  host_process_group_monitoring = var.host_process_group_monitoring
}

module "network_traffic" {
  source          = "./modules/dynatrace_network_traffic"
  network_traffic = var.network_traffic
}

module "nettracer" {
  source      = "./modules/dynatrace_nettracer"
  net_tracers = var.net_tracers
}

module "ebpf_service_discovery" {
  source                 = "./modules/dynatrace_ebpf_service_discovery"
  ebpf_service_discovery = var.ebpf_service_discovery
}
