variable "cics_mq_queue_id_includes" {
  type        = list(string)
  default     = ["CICS.INCLUDE.QUEUE1", "CICS.INCLUDE.QUEUE2"]
}

variable "cics_mq_queue_id_excludes" {
  type        = list(string)
  default     = ["CICS.EXCLUDE.QUEUE1"]
}

variable "ims_mq_queue_id_excludes" {
  type        = list(string)
  default     = ["IMS.EXCLUDE.QUEUE1"]
}

variable "ims_cr_trn_id_includes" {
  type        = list(string)
  default     = ["IMS.TRN.START", "IMS.TRN.END"]
}
