
# ─── Business Events ──────────────────────────────────────
module "business_events" {
  source                   = "./modules/dynatrace_openpipeline_business_events"
  enable_business_events   = var.enable_business_events
  business_event_pipelines = var.business_event_pipelines
}

# ─── Standard Events ──────────────────────────────────────
module "events" {
  source             = "./modules/dynatrace_openpipeline_events"
  enable_events      = var.enable_events
  events_endpoints   = var.events_endpoints
  events_pipelines   = var.events_pipelines
  events_routing     = var.events_routing
}

# ─── Log Ingestion ────────────────────────────────────────
module "logs" {
  source         = "./modules/dynatrace_openpipeline_logs"
  enable_logs    = var.enable_logs
  logs_pipelines = var.logs_pipelines
}

# ─── Security Events ──────────────────────────────────────
module "security_events" {
  source                    = "./modules/dynatrace_openpipeline_security_events"
  enable_security_events    = var.enable_security_events
  security_event_pipelines  = var.security_event_pipelines
}

# ─── SDLC Events ──────────────────────────────────────────
module "sdlc_events" {
  source           = "./modules/dynatrace_openpipeline_sdlc_events"
  enable_sdlc_events = var.enable_sdlc_events
  sdlc_endpoints     = var.sdlc_endpoints
  sdlc_pipelines     = var.sdlc_pipelines
  sdlc_routing       = var.sdlc_routing
}
