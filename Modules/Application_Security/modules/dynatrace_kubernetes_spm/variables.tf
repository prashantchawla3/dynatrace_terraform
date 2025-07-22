variable "kubernetes_spm" {
  description = "List of Kubernetes SPM configurations"
  type = list(object({
    scope                                  = string
    configuration_dataset_pipeline_enabled = bool
  }))
  default = []
}