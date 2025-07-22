output "custom_service_ids" {
  value = [for cs in dynatrace_custom_service.this : cs.id]
}

output "management_zone_ids" {
  value = [for mz in dynatrace_management_zone_v2.this : mz.id]
}

output "external_web_request_ids" {
  value = [for ewr in dynatrace_service_external_web_request.this : ewr.id]
}

output "full_web_request_ids" {
  value = [for fwr in dynatrace_service_full_web_request.this : fwr.id]
}

output "full_web_service_ids" {
  value = [for fws in dynatrace_service_full_web_service.this : fws.id]
}

output "unified_services_metrics_ids" {
  value = [for usm in dynatrace_unified_services_metrics.this : usm.id]
}

output "unified_services_opentel_ids" {
  value = [for uso in dynatrace_unified_services_opentel.this : uso.id]
}

output "service_detection_rule_ids" {
  value = [for k, v in dynatrace_service_detection_rules.this : v.id]
}

output "external_web_service_ids" {
  value = [for k, v in dynatrace_service_external_web_service.this : v.id]
}

output "service_splitting_rule_ids" {
  value = [for k, v in dynatrace_service_splitting.this : v.id]
}
