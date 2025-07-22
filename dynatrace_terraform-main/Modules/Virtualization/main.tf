
# ─── VMware Monitoring Integration ─────────────────────────
module "vmware_monitoring" {
  source         = "./modules/dynatrace_vmware"
  vmware_configs = var.vmware_configs
}
