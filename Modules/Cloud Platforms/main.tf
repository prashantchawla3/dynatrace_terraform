
module "cloud_foundry_module" {
  source = "./modules/dynatrace_cloud_foundry"
  cloud_foundry = var.cloud_foundry
}

module "k8s_monitoring_module" {
  source = "./modules/dynatrace_k8s_monitoring"
  k8s_monitoring = var.k8s_monitoring
}

module "kubernetes_module" {
  source = "./modules/dynatrace_kubernetes"
  kubernetes = var.kubernetes
}

module "kubernetes_app_module" {
  source = "./modules/dynatrace_kubernetes_app"
  kubernetes_app = var.kubernetes_app
}

module "kubernetes_enrichment_module" {
  source = "./modules/dynatrace_kubernetes_enrichment"
  kubernetes_enrichment = var.kubernetes_enrichment
}
