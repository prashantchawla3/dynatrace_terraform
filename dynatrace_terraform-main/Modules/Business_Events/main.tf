
module "business_events_buckets" {
  source           = "./modules/dynatrace_business_events_buckets"
  buckets_enabled  = var.buckets_enabled
  bucket_name      = var.bucket_name
  buckets_matcher  = var.buckets_matcher
}


module "business_events_capturing_variants" {
  source                  = "./modules/dynatrace_business_events_capturing_variants"
  rule_name               = var.rule_name
  content_type_matcher    = var.content_type_matcher
  content_type_value      = var.content_type_value
  parser                  = var.parser
  scope                   = var.scope
  event_data_fields       = var.event_data_fields
  provider_source         = var.provider_source
  provider_source_type    = var.provider_source_type
  type_source             = var.type_source
  type_source_type        = var.type_source_type
  trigger_type            = var.trigger_type
  trigger_case_sensitive  = var.trigger_case_sensitive
  trigger_value           = var.trigger_value
  trigger_data_source     = var.trigger_data_source
}


module "business_events_metrics" {
  source             = "./modules/dynatrace_business_events_metrics"
  metrics_enabled    = var.metrics_enabled
  metrics_key        = var.metrics_key
  metrics_matcher    = var.metrics_matcher
  measure            = var.measure
  measure_attribute  = var.measure_attribute
}


module "business_events_oneagent" {
  source                = "./modules/dynatrace_business_events_oneagent"
  oneagent_enabled      = var.oneagent_enabled
  category_source_type  = var.category_source_type
}


module "business_events_oneagent_outgoing" {
  source                         = "./modules/dynatrace_business_events_oneagent_outgoing"
  outgoing_enabled               = var.outgoing_enabled
  outgoing_category_source       = var.outgoing_category_source
  outgoing_category_source_type  = var.outgoing_category_source_type
  outgoing_field_name            = var.outgoing_field_name
  outgoing_field_path            = var.outgoing_field_path
  outgoing_field_source_type     = var.outgoing_field_source_type
  outgoing_provider_source       = var.outgoing_provider_source
  outgoing_provider_source_type  = var.outgoing_provider_source_type
  outgoing_type_source           = var.outgoing_type_source
  outgoing_type_source_type      = var.outgoing_type_source_type
  outgoing_trigger_type          = var.outgoing_trigger_type
  outgoing_trigger_case_sensitive = var.outgoing_trigger_case_sensitive
  outgoing_trigger_value         = var.outgoing_trigger_value
  outgoing_trigger_data_source   = var.outgoing_trigger_data_source
}

module "business_events_processing" {
  source                = "./modules/dynatrace_business_events_processing"
  processing_enabled    = var.processing_enabled
  processing_matcher    = var.processing_matcher
  processing_script     = var.processing_script
  sample_event          = var.sample_event
  transformation_fields = var.transformation_fields
}


module "business_events_security_context" {
  source                     = "./modules/dynatrace_business_events_security_context"
  security_query             = var.security_query
  security_value_source_field = var.security_value_source_field
  security_value_source      = var.security_value_source
}
