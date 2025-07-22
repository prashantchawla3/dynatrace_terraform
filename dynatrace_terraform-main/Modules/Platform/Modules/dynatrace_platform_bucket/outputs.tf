output "platform_bucket_names" {
  value = [for k, v in dynatrace_platform_bucket.this : v.name]
}
