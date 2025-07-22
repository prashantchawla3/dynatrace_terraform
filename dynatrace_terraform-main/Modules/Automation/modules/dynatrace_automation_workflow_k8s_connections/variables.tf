variable "k8s" {
  type = object({
    name      = string
    uid       = string
    namespace = string
    token     = string
  })
  description = "Kubernetes connection configuration"
  default = {
    name      = "k8s-default"
    uid       = "cluster-uid-123"
    namespace = "default"
    token     = "changeme"
  }
}