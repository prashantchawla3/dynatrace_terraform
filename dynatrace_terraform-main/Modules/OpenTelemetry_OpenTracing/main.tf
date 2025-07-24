

# ─── Attribute Allow List ────────────────────────────────
module "attribute_allow_list" {
  source               = "./modules/dynatrace_attribute_allow_list"
  attribute_allow_list = var.attribute_allow_list
}

# ─── Attribute Block List ────────────────────────────────
module "attribute_block_list" {
  source               = "./modules/dynatrace_attribute_block_list"
  attribute_block_list = var.attribute_block_list
}

# ─── Attribute Masking Logic ─────────────────────────────
module "attribute_masking" {
  source             = "./modules/dynatrace_attribute_masking"
  attribute_masking  = var.attribute_masking
}

# ─── OpenTelemetry Metric Routing & Filtering ────────────
module "opentelemetry_metrics" {
  source                = "./modules/dynatrace_opentelemetry_metrics"
  opentelemetry_metrics = var.opentelemetry_metrics
  attributes_preferences = var.attributes_preferences
}

# ─── Span Capture Rules ──────────────────────────────────
module "span_capture_rule" {
  source             = "./modules/dynatrace_span_capture_rule"
  span_capture_rules = var.span_capture_rules
  span_context_propagation = var.span_context_propagation
  span_entry_points  = var.span_entry_points
}
