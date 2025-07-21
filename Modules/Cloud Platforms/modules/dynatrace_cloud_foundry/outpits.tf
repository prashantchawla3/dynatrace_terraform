output "cloud_foundry_keys" {
  description = "Keys of the created CloudFoundry resources"
  value       = keys(dynatrace_cloud_foundry.cloud_foundry)
}