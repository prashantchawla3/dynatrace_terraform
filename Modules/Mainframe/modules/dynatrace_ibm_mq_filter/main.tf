resource "dynatrace_ibm_mq_filters" "mq_filters" {
  cics_mq_queue_id_includes = var.cics_mq_queue_id_includes
  cics_mq_queue_id_excludes = var.cics_mq_queue_id_excludes
  ims_mq_queue_id_excludes  = var.ims_mq_queue_id_excludes
  ims_cr_trn_id_includes    = var.ims_cr_trn_id_includes
}
