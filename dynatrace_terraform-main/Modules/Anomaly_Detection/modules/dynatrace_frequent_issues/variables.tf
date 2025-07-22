variable "frequent_issues" {
  description = "Configuration for detecting frequent issue patterns in apps, transactions, and infrastructure"
  type        = object({
    detect_apps  = bool
    detect_txn   = bool
    detect_infra = bool
  })
  default = {
    detect_apps  = false
    detect_txn   = false
    detect_infra = false
  }
}
