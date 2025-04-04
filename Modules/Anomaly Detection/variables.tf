variable "aws_anomalies_name" {
  description = "Name for the AWS anomalies resource"
  type        = string
  default     = "aws_anomalies"
}

variable "custom_app_scope" {
  description = "Scope for the custom application anomalies"
  type        = string
  default     = "CUSTOM_APPLICATION-1234567890000000"
}

variable "custom_app_crash_rate_scope" {
  description = "Scope for the custom application crash rate"
  type        = string
  default     = "CUSTOM_APPLICATION-1234567890000000"
}

variable "database_anomalies_scope" {
  description = "Scope for the database anomalies"
  type        = string
  default     = "environment"
}

variable "davis_anomaly_detectors_name" {
  description = "Name for the Davis anomaly detectors"
  type        = string
  default     = "davis_anomaly_detectors"
}

variable "disk_anomalies_scope" {
  description = "Scope for the disk anomalies"
  type        = string
  default     = "environment"
}

variable "disk_anomaly_rules_name" {
  description = "Name for the disk anomaly rules"
  type        = string
  default     = "disk_anomaly_rules"
}

variable "disk_edge_anomaly_detectors_name" {
  description = "Name for the disk edge anomaly detectors"
  type        = string
  default     = "disk_edge_anomaly_detectors"
}

variable "disk_specific_anomalies_disk_id" {
  description = "Disk ID for the specific disk anomalies"
  type        = string
  default     = "DISK-1234567890000000"
}

variable "host_anomalies_scope" {
  description = "Scope for the host anomalies"
  type        = string
  default     = "HOST-1234567890000000"
}

variable "k8s_cluster_anomalies_scope" {
  description = "Scope for the Kubernetes cluster anomalies"
  type        = string
  default     = "environment"
}

variable "k8s_namespace_anomalies_scope" {
  description = "Scope for the Kubernetes namespace anomalies"
  type        = string
  default     = "environment"
}

variable "k8s_node_anomalies_scope" {
  description = "Scope for the Kubernetes node anomalies"
  type        = string
  default     = "environment"
}

variable "k8s_pvc_anomalies_scope" {
  description = "Scope for the Kubernetes PVC anomalies"
  type        = string
  default     = "environment"
}

variable "k8s_workload_anomalies_scope" {
  description = "Scope for the Kubernetes workload anomalies"
  type        = string
  default     = "environment"
}

variable "metric_events_name" {
  description = "Name for the metric events"
  type        = string
  default     = "metric_events"
}

variable "mobile_app_scope" {
  description = "Scope for the mobile application anomalies"
  type        = string
  default     = "MOBILE_APPLICATION-1234567890000000"
}

variable "mobile_app_crash_rate_application_id" {
  description = "Application ID for the mobile application crash rate"
  type        = string
  default     = "MOBILE_APPLICATION-1234567890000000"
}

variable "service_anomalies_scope" {
  description = "Scope for the service anomalies"
  type        = string
  default     = "SERVICE-1234567890000000"
}

variable "vmware_anomalies_name" {
  description = "Name for the VMware anomalies"
  type        = string
  default     = "vmware_anomalies"
}

variable "web_app_scope" {
  description = "Scope for the web application anomalies"
  type        = string
  default     = "APPLICATION-1234567890000000"
}