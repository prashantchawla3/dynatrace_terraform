output "hub_extension_versions" {
  value = [for r in dynatrace_hub_extension_active_version.this : r.version]
}
