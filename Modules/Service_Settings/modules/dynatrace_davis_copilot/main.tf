resource "dynatrace_davis_copilot" "this" {
  enable_copilot                   = var.enable_copilot
  enable_tenant_aware_data_mining = var.enable_tenant_aware_data_mining

  blocklist_entries {
    blocklist_entrie {
      name = var.blocklist_name
      type = var.blocklist_type
    }
  }
}
