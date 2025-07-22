
# ─── Log Agent Feature Flags ──────────────────────────────
module "log_agent_feature_flags" {
  source                  = "./modules/dynatrace_log_agent_feature_flags"
  log_agent_feature_flags = var.log_agent_feature_flags
}

# ─── Log Buckets ──────────────────────────────────────────
module "log_buckets" {
  source       = "./modules/dynatrace_log_buckets"
  log_buckets  = var.log_buckets
}

# ─── Log Custom Attribute ─────────────────────────────────
module "log_custom_attribute" {
  source               = "./modules/dynatrace_log_custom_attribute"
  log_custom_attribute = var.log_custom_attribute
}

# ─── Log Custom Source ────────────────────────────────────
module "log_custom_source" {
  source            = "./modules/dynatrace_log_custom_source"
  log_custom_source = var.log_custom_source
}

# ─── Log Debug Settings ───────────────────────────────────
module "log_debug_settings" {
  source             = "./modules/dynatrace_log_debug_settings"
  log_debug_settings = var.log_debug_settings
}

# ─── Log Events ───────────────────────────────────────────
module "log_events" {
  source      = "./modules/dynatrace_log_events"
  log_events  = var.log_events
}

# ─── Log Metrics ──────────────────────────────────────────
module "log_metrics" {
  source       = "./modules/dynatrace_log_metrics"
  log_metrics  = var.log_metrics
}

# ─── Log OneAgent Settings ────────────────────────────────
module "log_oneagent" {
  source        = "./modules/dynatrace_log_oneagent"
  log_oneagent  = var.log_oneagent
}

# ─── Log Processing Rules ─────────────────────────────────
module "log_processing" {
  source          = "./modules/dynatrace_log_processing"
  log_processing  = var.log_processing
}

# ─── Log Security Context ─────────────────────────────────
module "log_security_context" {
  source               = "./modules/dynatrace_log_security_context"
  log_security_context = var.log_security_context
}

# ─── Log Sensitive Data Masking ───────────────────────────
module "log_sensitive_data_masking" {
  source                     = "./modules/dynatrace_log_sensitive_data_masking"
  log_sensitive_data_masking = var.log_sensitive_data_masking
}

# ─── Log Storage Routing ──────────────────────────────────
module "log_storage" {
  source       = "./modules/dynatrace_log_storage"
  log_storage  = var.log_storage
}

# ─── Log Timestamp Extraction ─────────────────────────────
module "log_timestamp" {
  source        = "./modules/dynatrace_log_timestamp"
  log_timestamp = var.log_timestamp
}
