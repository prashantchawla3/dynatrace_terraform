variable "kubernetes_app" {
  description = "Kubernetes app-level monitoring configuration"
  type = map(object({
    scope                 = string
    enable_kubernetes_app = bool
  }))
  default = {
    default_app = {
      scope                 = "app-scope"
      enable_kubernetes_app = true
    }
  }
}
