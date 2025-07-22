output "shared_documents" {
  value = { for k, v in dynatrace_direct_shares.this : k => v.document_id }
}
