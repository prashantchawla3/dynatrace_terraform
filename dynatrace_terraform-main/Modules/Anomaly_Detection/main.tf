module "dynatrace_disk_anomalies_v2" {
  source                  = "./modules/dynatrace_disk_anomalies_v2"
  disk_anomalies          = var.disk_anomalies
  disk_edge_detectors     = var.disk_edge_detectors
  disk_specific_anomalies = var.disk_specific_anomalies
}

module "dynatrace_disk_anomaly_rules" {
  source               = "./modules/dynatrace_disk_anomaly_rules"
  disk_anomaly_rules   = var.disk_anomaly_rules
}

module "dynatrace_aws_anomalies" {
  source                              = "./modules/dynatrace_aws_anomalies"
  ec_2_candidate_high_cpu_detection   = var.ec_2_candidate_high_cpu_detection
  elb_high_connection_errors_detection = var.elb_high_connection_errors_detection
  lambda_high_error_rate_detection     = var.lambda_high_error_rate_detection
}

module "dynatrace_rds_anomalies" {
  source                                = "./modules/dynatrace_rds_anomalies"
  rds_high_cpu_detection                = var.rds_high_cpu_detection
  rds_high_memory_detection             = var.rds_high_memory_detection
  rds_high_write_read_latency_detection = var.rds_high_write_read_latency_detection
  rds_low_storage_detection             = var.rds_low_storage_detection
  rds_restarts_sequence_detection       = var.rds_restarts_sequence_detection
}

module "dynatrace_custom_app_anomalies" {
  source                 = "./modules/dynatrace_custom_app_anomalies"
  custom_app_scope       = var.custom_app_scope
  error_rate_increase    = var.error_rate_increase
  slow_user_actions      = var.slow_user_actions
  unexpected_high_load   = var.unexpected_high_load
  unexpected_low_load    = var.unexpected_low_load
}

module "dynatrace_custom_app_crash_rate" {
  source               = "./modules/dynatrace_custom_app_crash_rate"
  crash_rate_increase  = var.crash_rate_increase
}

module "dynatrace_database_anomalies" {
  source               = "./modules/dynatrace_database_anomalies"
  database_scope       = var.database_scope
  database_connections = var.database_connections
}

module "dynatrace_frequent_issues" {
  source          = "./modules/dynatrace_frequent_issues"
  frequent_issues = var.frequent_issues
}

module "dynatrace_mobile_app_anomalies" {
  source               = "./modules/dynatrace_mobile_app_anomalies"
  mobile_app_anomalies  = var.mobile_app_anomalies
}

module "dynatrace_mobile_app_crash_rate" {
  source              = "./modules/dynatrace_mobile_app_crash_rate"
  mobile_app_crash_rate = mobile_app_crash_rate
}

module "dynatrace_web_app_anomalies" {
  source               = "./modules/dynatrace_web_app_anomalies"
  web_app_anomalies    = var.web_app_anomalies
}

module "dynatrace_service_anomalies_v2" {
  source               = "./modules/dynatrace_service_anomalies_v2"
  service_anomaliese        = var.service_anomalies
}

module "dynatrace_vmware_anomalies" {
  source               = "./modules/dynatrace_vmware_anomalies"
  vmware_anomalies         = var.vmware_anomalies
}

module "dynatrace_host_anomalies_v2" {
  source               = "./modules/dynatrace_host_anomalies_v2"
  host_anomalies         = var.host_anomalies
}

module "dynatrace_k8s_cluster_anomalies" {
  source               = "./modules/dynatrace_k8s_cluster_anomalies"
  k8s_cluster_anomalies        = var.k8s_cluster_anomalies
}

module "dynatrace_k8s_namespace_anomalies" {
  source               = "./modules/dynatrace_k8s_namespace_anomalies"
  k8s_namespace_anomalies         = var.k8s_namespace_anomalies
}

module "dynatrace_k8s_node_anomalies" {
  source               = "./modules/dynatrace_k8s_node_anomalies"
  k8s_node_anomalies         = var.k8s_node_anomalies
}

module "dynatrace_k8s_pvc_anomalies" {
  source               = "./modules/dynatrace_k8s_pvc_anomalies"
  k8s_pvc_anomalies         = var.k8s_pvc_anomalies
}

module "dynatrace_k8s_workload_anomalies" {
  source               = "./modules/dynatrace_k8s_workload_anomalies"
  k8s_workload_anomalies         = var.k8s_workload_anomalies
}

module "dynatrace_metric_events" {
  source               = "./modules/dynatrace_metric_events"
  metric_events        = var.metric_events

}
