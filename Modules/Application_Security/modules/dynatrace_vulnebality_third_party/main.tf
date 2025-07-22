resource "dynatrace_vulnerability_third_party" "third_party" {
  count = length(var.vulnerability_third_party)

  enabled  = var.vulnerability_third_party[count.index].enabled
  mode     = var.vulnerability_third_party[count.index].mode
  operator = var.vulnerability_third_party[count.index].operator
  property = var.vulnerability_third_party[count.index].property
  value    = var.vulnerability_third_party[count.index].value
}