variable "ec_2_candidate_high_cpu_detection" {
  description = "Anomaly detection config for EC2 instances with high CPU usage"
  type        = object({
    enabled         = bool
    detection_mode  = string
    custom_thresholds = object({
      cpu_usage = number
    })
  })
  default = null
}

variable "elb_high_connection_errors_detection" {
  description = "Detection for high connection errors in ELB resources"
  type        = object({
    enabled         = bool
    detection_mode  = string
    custom_thresholds = object({
      connection_errors_per_minute = number
    })
  })
  default = null
}

variable "lambda_high_error_rate_detection" {
  description = "Configuration for detecting high error rate in Lambda functions"
  type        = object({
    enabled         = bool
    detection_mode  = string
    custom_thresholds = object({
      failed_invocations_rate = number
    })
  })
  default = null
}

variable "rds_high_cpu_detection" {
  description = "Detects high CPU usage in RDS instances"
  type        = object({
    enabled = bool
  })
  default = null
}

variable "rds_high_memory_detection" {
  description = "Detects memory-related anomalies in RDS instances"
  type        = object({
    enabled         = bool
    detection_mode  = string
    custom_thresholds = object({
      free_memory = number
      swap_usage  = number
    })
  })
  default = null
}

variable "rds_high_write_read_latency_detection" {
  description = "Detects high latency for read/write operations in RDS"
  type        = object({
    enabled         = bool
    detection_mode  = string
    custom_thresholds = object({
      read_write_latency = number
    })
  })
  default = null
}

variable "rds_low_storage_detection" {
  description = "Detects low storage capacity in RDS instances"
  type        = object({
    enabled = bool
  })
  default = null
}

variable "rds_restarts_sequence_detection" {
  description = "Detects unusual restart sequences in RDS instances"
  type        = object({
    enabled = bool
  })
  default = null
}