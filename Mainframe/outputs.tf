output "queue_manager_name" {
  value = dynatrace_queue_manager.queue_manager.name
}

output "ims_bridge_name" {
  value = dynatrace_ims_bridges.ims_bridges.name
}

output "queue_sharing_group_name" {
  value = dynatrace_queue_sharing_groups.queue_sharing_groups.name
}
