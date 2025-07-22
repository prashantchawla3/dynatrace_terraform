output "document_ids" {
  value = { for k, v in dynatrace_document.this : k => v.id }
}
