variable "ebpf_service_discovery" {
  description = "Enable eBPF-based service discovery for deep process analytics"
  type = list(object({
    ebpf  = bool
    scope = string
  }))
  default = [
    { ebpf = true, scope = "kubernetes:apps" }
  ]
}
