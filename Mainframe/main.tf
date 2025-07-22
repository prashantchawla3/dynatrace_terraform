
# ─── MQ Queue Filtering ──────────────────────────────────
module "cics_mq_queue_id_includes" {
  source                    = "./modules/dynatrace_ibm_mq_filters"
  cics_mq_queue_id_includes = var.cics_mq_queue_id_includes
}

module "cics_mq_queue_id_excludes" {
  source                    = "./modules/dynatrace_ibm_mq_filters"
  cics_mq_queue_id_excludes = var.cics_mq_queue_id_excludes
}

module "ims_mq_queue_id_excludes" {
  source                   = "./modules/dynatrace_ibm_mq_filters"
  ims_mq_queue_id_excludes = var.ims_mq_queue_id_excludes
}

# ─── IMS Configuration ───────────────────────────────────
module "ims_cr_trn_id_includes" {
  source                   = "./modules/dynatrace_ibm_mq_filters"
  ims_cr_trn_id_includes   = var.ims_cr_trn_id_includes
}

module "ims_bridge_name" {
  source           = "./modules/dynatrace_ims_bridges"
  ims_bridge_name  = var.ims_bridge_name
}

module "ims_queue_managers" {
  source              = "./modules/dynatrace_queue_manager"
  ims_queue_managers  = var.ims_queue_managers
}

# ─── Regional & Protocol Toggles ─────────────────────────
module "group_cics_regions" {
  source            = "./modules/dynatrace_mainframe_transaction_monitoring"
  group_cics_regions = var.group_cics_regions
}

module "group_ims_regions" {
  source           = "./modules/dynatrace_mainframe_transaction_monitoring"
  group_ims_regions = var.group_ims_regions
}

module "monitor_all_ctg_protocols" {
  source                   = "./modules/dynatrace_mainframe_transaction_monitoring"
  monitor_all_ctg_protocols = var.monitor_all_ctg_protocols
}

module "monitor_all_incoming_web_requests" {
  source                        = "./modules/dynatrace_mainframe_transaction_monitoring"
  monitor_all_incoming_web_requests = var.monitor_all_incoming_web_requests
}

module "node_limit" {
  source      = "./modules/dynatrace_mainframe_transaction_monitoring"
  node_limit  = var.node_limit
}

module "zos_cics_service_detection_uses_transaction_id" {
  source                                      = "./modules/dynatrace_mainframe_transaction_monitoring"
  zos_cics_service_detection_uses_transaction_id = var.zos_cics_service_detection_uses_transaction_id
}

module "zos_ims_service_detection_uses_transaction_id" {
  source                                     = "./modules/dynatrace_mainframe_transaction_monitoring"
  zos_ims_service_detection_uses_transaction_id = var.zos_ims_service_detection_uses_transaction_id
}

# ─── Queue Manager & Cluster ─────────────────────────────
module "queue_manager_name" {
  source             = "./modules/queue_manager_name"
  queue_manager_name = var.queue_manager_name
}

module "queue_manager_clusters" {
  source                 = "./modules/dynatrace_queue_manager"
  queue_manager_clusters = var.queue_manager_clusters
}

module "alias_queues" {
  source        = "./modules/dynatrace_queue_manager"
  alias_queues  = var.alias_queues
}

module "remote_queues" {
  source         = "./modules/dynatrace_queue_manager"
  remote_queues  = var.remote_queues
}

module "cluster_queues" {
  source          = "./modules/dynatrace_queue_manager"
  cluster_queues  = var.cluster_queues
}

# ─── Queue Sharing Group ─────────────────────────────────
module "queue_sharing_group_name" {
  source                    = "./modules/dynatrace_queue_manager"
  queue_sharing_group_name = var.queue_sharing_group_name
}

module "queue_sharing_group_managers" {
  source                         = "./modules/dynatrace_queue_manager"
  queue_sharing_group_managers  = var.queue_sharing_group_managers
}

module "queue_sharing_group_shared_queues" {
  source                             = "./modules/dynatrace_queue_manager"
  queue_sharing_group_shared_queues = var.queue_sharing_group_shared_queues
}

# ─── Transaction ID Mapping ──────────────────────────────
module "cics_terminal_transaction_ids" {
  source                         = "./modules/dynatrace_transaction_start_filters"
  cics_terminal_transaction_ids = var.cics_terminal_transaction_ids
}

module "cics_transaction_ids" {
  source              = "./modules/dynatrace_transaction_start_filters"
  cics_transaction_ids = var.cics_transaction_ids
}

module "ims_transaction_ids" {
  source             = "./modules/dynatrace_transaction_start_filters"
  ims_transaction_ids = var.ims_transaction_ids
}

module "ims_terminal_transaction_ids" {
  source                      = "./modules/dynatrace_transaction_start_filters"
  ims_terminal_transaction_ids = var.ims_terminal_transaction_ids
}
