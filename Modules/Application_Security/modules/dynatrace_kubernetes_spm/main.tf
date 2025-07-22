resource "dynatrace_kubernetes_spm" "spm" {
  count = length(var.kubernetes_spm)

  scope                                  = var.kubernetes_spm[count.index].scope
  configuration_dataset_pipeline_enabled = var.kubernetes_spm[count.index].configuration_dataset_pipeline_enabled
}