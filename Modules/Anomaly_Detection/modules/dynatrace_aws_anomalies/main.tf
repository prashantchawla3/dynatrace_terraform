resource "dynatrace_aws_anomalies" "this" {
  dynamic "ec_2_candidate_high_cpu_detection" {
    for_each = var.ec_2_candidate_high_cpu_detection != null ? [var.ec_2_candidate_high_cpu_detection] : []
    content {
      enabled        = ec_2_candidate_high_cpu_detection.value.enabled
      detection_mode = ec_2_candidate_high_cpu_detection.value.detection_mode
      custom_thresholds {
        cpu_usage = ec_2_candidate_high_cpu_detection.value.custom_thresholds.cpu_usage
      }
    }
  }

  dynamic "elb_high_connection_errors_detection" {
    for_each = var.elb_high_connection_errors_detection != null ? [var.elb_high_connection_errors_detection] : []
    content {
      enabled        = elb_high_connection_errors_detection.value.enabled
      detection_mode = elb_high_connection_errors_detection.value.detection_mode
      custom_thresholds {
        connection_errors_per_minute = elb_high_connection_errors_detection.value.custom_thresholds.connection_errors_per_minute
      }
    }
  }

  dynamic "lambda_high_error_rate_detection" {
    for_each = var.lambda_high_error_rate_detection != null ? [var.lambda_high_error_rate_detection] : []
    content {
      enabled        = lambda_high_error_rate_detection.value.enabled
      detection_mode = lambda_high_error_rate_detection.value.detection_mode
      custom_thresholds {
        failed_invocations_rate = lambda_high_error_rate_detection.value.custom_thresholds.failed_invocations_rate
      }
    }
  }

  dynamic "rds_high_cpu_detection" {
    for_each = var.rds_high_cpu_detection != null ? [var.rds_high_cpu_detection] : []
    content {
      enabled = rds_high_cpu_detection.value.enabled
    }
  }

  dynamic "rds_high_memory_detection" {
    for_each = var.rds_high_memory_detection != null ? [var.rds_high_memory_detection] : []
    content {
      enabled        = rds_high_memory_detection.value.enabled
      detection_mode = rds_high_memory_detection.value.detection_mode
      custom_thresholds {
        free_memory = rds_high_memory_detection.value.custom_thresholds.free_memory
        swap_usage  = rds_high_memory_detection.value.custom_thresholds.swap_usage
      }
    }
  }

  dynamic "rds_high_write_read_latency_detection" {
    for_each = var.rds_high_write_read_latency_detection != null ? [var.rds_high_write_read_latency_detection] : []
    content {
      enabled        = rds_high_write_read_latency_detection.value.enabled
      detection_mode = rds_high_write_read_latency_detection.value.detection_mode
      custom_thresholds {
        read_write_latency = rds_high_write_read_latency_detection.value.custom_thresholds.read_write_latency
      }
    }
  }

  dynamic "rds_low_storage_detection" {
    for_each = var.rds_low_storage_detection != null ? [var.rds_low_storage_detection] : []
    content {
      enabled = rds_low_storage_detection.value.enabled
    }
  }

  dynamic "rds_restarts_sequence_detection" {
    for_each = var.rds_restarts_sequence_detection != null ? [var.rds_restarts_sequence_detection] : []
    content {
      enabled = rds_restarts_sequence_detection.value.enabled
    }
  }
}