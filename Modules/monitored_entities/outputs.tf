
output "custom_device_entity_id" {
  description = "The entity ID of the created custom device"
  value       = dynatrace_custom_device.custom_device.entity_id
}

output "custom_device_id" {
  description = "The resource ID of the created custom device"
  value       = dynatrace_custom_device.custom_device.id
}
