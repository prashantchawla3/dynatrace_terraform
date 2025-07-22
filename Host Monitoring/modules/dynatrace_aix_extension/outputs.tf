output "aix_extension_ids" {
  description = "The IDs of the created AIX extensions."
  value       = dynatrace_aix_extension.example[*].id
}
