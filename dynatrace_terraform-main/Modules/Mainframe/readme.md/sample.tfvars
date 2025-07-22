cics_mq_queue_id_includes = ["StringA1", "StringB1", "StringC1"]
cics_mq_queue_id_excludes = ["StringA2", "StringB2", "StringC2"]
ims_mq_queue_id_excludes  = ["StringA4", "StringB4", "StringC4"]
ims_cr_trn_id_includes    = ["StringA5", "StringB5", "StringC5"]

ims_bridge_name = "example-bridge"
ims_queue_managers = {
  mgr1 = { name = "QueueManagerExample1" }
  mgr2 = { name = "QueueManagerExample2", queue_manager_queue = ["Queue1", "Queue2"] }
}

group_cics_regions                          = true
group_ims_regions                           = false
monitor_all_ctg_protocols                   = false
monitor_all_incoming_web_requests           = false
node_limit                                  = 500
zos_cics_service_detection_uses_transaction_id = false
zos_ims_service_detection_uses_transaction_id  = false

queue_manager_name     = "example-queue-manager"
queue_manager_clusters = ["Cluster 1", "Cluster 2"]

alias_queues = {
  a = { alias_queue_name = "Alias Queue A", base_queue_name = "Base Queue A" }
  b = { alias_queue_name = "Alias Queue B", base_queue_name = "Base Queue B", cluster_visibility = ["Cluster 1"] }
  c = { alias_queue_name = "Alias Queue C", base_queue_name = "Base Queue C", cluster_visibility = ["Cluster 1", "Cluster 2"] }
}

remote_queues = {
  a = { local_queue_name = "Local Queue A", remote_queue_name = "Remote Queue A", remote_queue_manager = "Remote Queue Manager A" }
  b = { local_queue_name = "Local Queue B", remote_queue_name = "Remote Queue B", remote_queue_manager = "Remote Queue Manager B", cluster_visibility = ["Cluster 1"] }
  c = { local_queue_name = "Local Queue C", remote_queue_name = "Remote Queue C", remote_queue_manager = "Remote Queue Manager C", cluster_visibility = ["Cluster 1", "Cluster 2"] }
}

cluster_queues = {
  a = { local_queue_name = "Local Queue A" }
  b = { local_queue_name = "Local Queue B", cluster_visibility = ["Cluster 1"] }
  c = { local_queue_name = "Local Queue C", cluster_visibility = ["Cluster 1", "Cluster 2"] }
}

queue_sharing_group_name         = "example-sharing-group"
queue_sharing_group_managers     = ["QueueManager1", "QueueManager2", "QueueManager3"]
queue_sharing_group_shared_queues = ["SharedQueue1", "SharedQueue2"]

cics_terminal_transaction_ids = ["DTAX", "ATAX"]
cics_transaction_ids          = ["TIPU"]
ims_transaction_ids           = ["FAKE"]
ims_terminal_transaction_ids  = ["DTAX", "ATAX"]
