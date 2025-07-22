output "webhook_notification_ids" {
  value = [for n in dynatrace_appsec_notification.webhook : n.id]
}

output "attack_alerting_names" {
  value = [for a in dynatrace_attack_alerting.alerting : a.name]
}

output "attack_allowlist_names" {
  value = [for a in dynatrace_attack_allowlist.allowlist : a.rule_name]
}

output "attack_rule_comments" {
  value = [for r in dynatrace_attack_rules.rules : r.metadata[0].comment]
}

output "attack_settings_enabled" {
  value = [for s in dynatrace_attack_settings.settings : s.enabled]
}

output "kubernetes_spm_scopes" {
  value = [for k in dynatrace_kubernetes_spm.spm : k.scope]
}

output "management_zone_names" {
  value = [for m in dynatrace_management_zone_v2.mgmz : m.name]
}

output "vulnerability_alerting_names" {
  value = [for v in dynatrace_vulnerability_alerting.alerting : v.name]
}

output "vulnerability_code_comments" {
  value = [for v in dynatrace_vulnerability_code.code : v.metadata[0].comment]
}

output "vulnerability_third_party_values" {
  value = [for v in dynatrace_vulnerability_third_party.third_party : v.value]
}
