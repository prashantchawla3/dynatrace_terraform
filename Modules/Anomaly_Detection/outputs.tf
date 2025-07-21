output "disk_anomalies_ids" {
  description = "IDs of the created Dynatrace disk anomalies"
  value = {
    for key, resource in dynatrace_disk_anomalies_v2.this :
    key => resource.id
  }
}
output "aws_anomalies_id" {
  value = dynatrace_aws_anomalies.this.id
}

output "custom_app_anomalies_scope" {
  value = dynatrace_custom_app_anomalies.this.scope
}

output "custom_app_crash_rate_scope" {
  value = dynatrace_custom_app_crash_rate.this.scope
}

output "database_anomalies_scope" {
  value = dynatrace_database_anomalies_v2.this.scope
}
output "frequent_issues_detect_apps" {
  description = "Whether application issues detection is enabled"
  value       = dynatrace_frequent_issues.this.detect_apps
}

output "frequent_issues_detect_txn" {
  description = "Whether transaction issues detection is enabled"
  value       = dynatrace_frequent_issues.this.detect_txn
}

output "frequent_issues_detect_infra" {
  description = "Whether infrastructure issues detection is enabled"
  value       = dynatrace_frequent_issues.this.detect_infra
}

output "host_anomalies_scope" {
  description = "The scope of the host anomalies configuration"
  value       = dynatrace_host_anomalies_v2.this.scope
}

output "host_anomalies_id" {
  description = "The ID of the host anomalies resource"
  value       = dynatrace_host_anomalies_v2.this.id
}
output "k8s_cluster_anomalies_scope" {
  description = "Scope of the Kubernetes cluster anomalies configuration"
  value       = dynatrace_k8s_cluster_anomalies.this.scope
}

output "k8s_namespace_anomalies_scope" {
  description = "Scope of the Kubernetes namespace anomalies configuration"
  value       = dynatrace_k8s_namespace_anomalies.this.scope
}

output "k8s_cluster_anomalies_id" {
  description = "ID of the Kubernetes cluster anomalies resource"
  value       = dynatrace_k8s_cluster_anomalies.this.id
}

output "k8s_namespace_anomalies_id" {
  description = "ID of the Kubernetes namespace anomalies resource"
  value       = dynatrace_k8s_namespace_anomalies.this.id
}
output "k8s_node_anomalies_scope" {
  description = "Scope of the Kubernetes node anomalies configuration"
  value       = dynatrace_k8s_node_anomalies.this.scope
}

output "k8s_node_anomalies_id" {
  description = "ID of the Kubernetes node anomalies resource"
  value       = dynatrace_k8s_node_anomalies.this.id
}

output "k8s_pvc_anomalies_scope" {
  description = "Scope of the Kubernetes PVC anomalies configuration"
  value       = dynatrace_k8s_pvc_anomalies.this.scope
}

output "k8s_pvc_anomalies_id" {
  description = "ID of the Kubernetes PVC anomalies resource"
  value       = dynatrace_k8s_pvc_anomalies.this.id
}
output "k8s_workload_anomalies_scope" {
  description = "Scope of the Kubernetes workload anomalies configuration"
  value       = dynatrace_k8s_workload_anomalies.this.scope
}

output "k8s_workload_anomalies_id" {
  description = "ID of the Kubernetes workload anomalies resource"
  value       = dynatrace_k8s_workload_anomalies.this.id
}

output "metric_events_summary" {
  description = "Summary of the metric event"
  value       = dynatrace_metric_events.this.summary
}

output "metric_events_enabled" {
  description = "Whether the metric event is enabled"
  value       = dynatrace_metric_events.this.enabled
}
output "mobile_app_anomalies_id" {
  description = "The ID of the Dynatrace Mobile App Anomalies resource"
  value       = dynatrace_mobile_app_anomalies.this.id
}

output "mobile_app_crash_rate_id" {
  description = "The ID of the Dynatrace Mobile App Crash Rate resource"
  value       = dynatrace_mobile_app_crash_rate.this.id
}

output "service_anomalies_id" {
  description = "The ID of the Dynatrace Service Anomalies V2 resource"
  value       = dynatrace_service_anomalies_v2.this.id
}
output "vmware_anomalies_ids" {
  description = "IDs of the created VMware anomaly resources"
  value       = [for k, v in dynatrace_vmware_anomalies.vmware : v.id]
}

output "web_app_anomalies_ids" {
  description = "IDs of the created Web App anomaly resources"
  value       = [for k, v in dynatrace_web_app_anomalies.web_app : v.id]
}

