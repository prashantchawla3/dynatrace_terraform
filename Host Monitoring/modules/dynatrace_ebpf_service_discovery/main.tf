resource "dynatrace_ebpf_service_discovery" "example" {
  count = length(var.ebpf_service_discovery)
  ebpf  = var.ebpf_service_discovery[count.index].ebpf
  scope = var.ebpf_service_discovery[count.index].scope
}
