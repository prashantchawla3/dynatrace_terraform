variable "group_cics_regions" {
  type    = bool
  default = true
}

variable "group_ims_regions" {
  type    = bool
  default = false
}

variable "monitor_all_ctg_protocols" {
  type    = bool
  default = true
}

variable "monitor_all_incoming_web_requests" {
  type    = bool
  default = true
}

variable "node_limit" {
  type    = number
  default = 2500
}

variable "zos_cics_service_detection_uses_transaction_id" {
  type    = bool
  default = true
}

variable "zos_ims_service_detection_uses_transaction_id" {
  type    = bool
  default = true
}
