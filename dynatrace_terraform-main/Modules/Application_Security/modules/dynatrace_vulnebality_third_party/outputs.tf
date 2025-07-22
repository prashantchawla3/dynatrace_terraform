output "vulnerability_third_party_values" {
  value = [for v in dynatrace_vulnerability_third_party.third_party : v.value]
}