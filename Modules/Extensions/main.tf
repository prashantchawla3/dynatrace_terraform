
# ─── Execution Controllers ────────────────────────────────
module "execution_controllers" {
  source              = "./modules/dynatrace_extension_execution_controller"
  execution_controllers = var.execution_controllers
}

# ─── Execution Remotes ────────────────────────────────────
module "execution_remotes" {
  source            = "./modules/dynatrace_extension_execution_remote"
  execution_remotes = var.execution_remotes
}

# ─── Hub Extension Versions ───────────────────────────────
module "hub_extension_versions" {
  source                = "./modules/dynatrace_hub_extension_active_version"
  hub_extension_versions = var.hub_extension_versions
}

# ─── Hub Extension Configs ────────────────────────────────
module "hub_extension_configs" {
  source               = "./modules/dynatrace_hub_extension_config"
  hub_extension_configs = var.hub_extension_configs
}
