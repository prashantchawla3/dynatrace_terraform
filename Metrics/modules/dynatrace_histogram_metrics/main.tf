
resource "dynatrace_histogram_metrics" "example" {
  enable_histogram_bucket_ingest = var.histogram_metrics_enable_histogram_bucket_ingest
}
