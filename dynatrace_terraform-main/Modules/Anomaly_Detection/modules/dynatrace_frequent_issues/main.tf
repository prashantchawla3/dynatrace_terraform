
resource "dynatrace_frequent_issues" "this" {
  detect_apps  = var.frequent_issues.detect_apps
  detect_txn   = var.frequent_issues.detect_txn
  detect_infra = var.frequent_issues.detect_infra
}
