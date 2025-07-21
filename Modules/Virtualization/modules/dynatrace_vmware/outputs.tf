output "vmware_ids" {
  description = "IDs of all created VMware resources"
  value = { for k, v in dynatrace_vmware.this : k => v.id }
}
