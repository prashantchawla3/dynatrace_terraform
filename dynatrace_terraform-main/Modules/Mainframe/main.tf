
# ─── IBM MQ Filters ───────────────────────────────────────
module "ibm_mq_filters" {
  source                          = "./modules/dynatrace_ibm_mq_filter"

  cics_mq_queue_id_includes       = var.cics_mq_queue_id_includes
  cics_mq_queue_id_excludes       = var.cics_mq_queue_id_excludes
  ims_mq_queue_id_excludes        = var.ims_mq_queue_id_excludes
  ims_cr_trn_id_includes          = var.ims_cr_trn_id_includes
}

# ─── IMS Bridge Configuration ─────────────────────────────
module "ims_bridges" {
  source           = "./modules/dynatrace_ims_bridges"
  ims_bridge_name  = var.ims_bridge_name
}

# ─── Mainframe Transaction Monitoring ─────────────────────
module "mainframe_transaction_monitoring" {
  source                                      = "./modules/dynatrace_mainframe_transaction_monitoring"

  group_cics_regions                          = var.group_cics_regions
  group_ims_regions                           = var.group_ims_regions
  monitor_all_ctg_protocols                   = var.monitor_all_ctg_protocols
  monitor_all_incoming_web_requests           = var.monitor_all_incoming_web_requests
  node_limit                                  = var.node_limit
  zos_cics_service_detection_uses_transaction_id = var.zos_cics_service_detection_uses_transaction_id
  zos_ims_service_detection_uses_transaction_id  = var.zos_ims_service_detection_uses_transaction_id
}

# ─── Queue Manager Configuration ──────────────────────────
module "queue_manager" {
  source = "./modules/dynatrace_queue_manager"

  ims_queue_managers                   = var.ims_queue_managers
  queue_manager_clusters               = var.queue_manager_clusters
  alias_queues                         = var.alias_queues
  remote_queues                        = var.remote_queues
  cluster_queues                       = var.cluster_queues
  queue_sharing_group_name             = var.queue_sharing_group_name
  queue_sharing_group_managers        = var.queue_sharing_group_managers
  queue_sharing_group_shared_queues   = var.queue_sharing_group_shared_queues
}

# ─── Transaction Start Filters ────────────────────────────
module "transaction_start_filters" {
  source = "./modules/dynatrace_transaction_start_filters"

  cics_terminal_transaction_ids   = var.cics_terminal_transaction_ids
  cics_transaction_ids            = var.cics_transaction_ids
  ims_transaction_ids             = var.ims_transaction_ids
  ims_terminal_transaction_ids    = var.ims_terminal_transaction_ids
}
