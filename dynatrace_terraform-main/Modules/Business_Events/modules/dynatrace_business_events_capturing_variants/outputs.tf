output "capturing_variant_id" {
  description = "The ID of the Business Events capturing variant"
  value       = dynatrace_business_events_capturing_variants.this.id
}

output "capturing_variant_scope" {
  description = "The scope of the capturing variant"
  value       = dynatrace_business_events_capturing_variants.this.scope
}

output "capturing_variant_content_type_matcher" {
  description = "The content type matcher used in the capturing variant"
  value       = dynatrace_business_events_capturing_variants.this.content_type_matcher
}

output "capturing_variant_content_type_value" {
  description = "The content type value used in the capturing variant"
  value       = dynatrace_business_events_capturing_variants.this.content_type_value
}

output "capturing_variant_parser" {
  description = "The parser used in the capturing variant"
  value       = dynatrace_business_events_capturing_variants.this.parser
}
