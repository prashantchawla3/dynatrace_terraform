output "dynatrace_web_app_enablement_ids" {
  value = [for enablement in dynatrace_web_app_enablement.web_app_enablement : enablement.id]
}
