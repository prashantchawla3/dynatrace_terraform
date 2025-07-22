
# ─── Davis CoPilot & Tenant-Aware AI ──────────────────────
module "dynatrace_davis_copilot" {
  source = "./modules/dynatrace_davis_copilot"

  enable_copilot                   = var.enable_copilot
  enable_tenant_aware_data_mining = var.enable_tenant_aware_data_mining
}
