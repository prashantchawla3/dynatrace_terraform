
# ─── ActiveGate Auto Update ───────────────────────────────
module "activegate_update" {
  source          = "./modules/dynatrace_activegate_updates"

  auto_update     = var.auto_update
  scope_activegate = var.scope_activegate
}

# ─── OneAgent Update Targeting ────────────────────────────
module "oneagent_update" {
  source         = "./modules/dynatrace_oneagent_updates"

  scope_oneagent = var.scope_oneagent
  target_version = var.target_version
  update_mode    = var.update_mode
}

# ─── OneAgent Update Window Scheduling ────────────────────
module "update_window" {
  source                  = "./modules/dynatrace_update_windows"

  name                    = var.name
  enabled                 = var.enabled
  recurrence              = var.recurrence
  once_recurrence_start   = var.once_recurrence_start
  once_recurrence_end     = var.once_recurrence_end
}
