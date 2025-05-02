output "custom_device_entity_id" {
  value       = dynatrace_custom_device.custom_device.entity_id
  description = "The entity ID of the custom device"
}

output "custom_device_id" {
  value       = dynatrace_custom_device.custom_device.id
  description = "The ID of the custom device resource"
}