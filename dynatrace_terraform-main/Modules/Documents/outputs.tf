output "document_ids" {
  value = { for k, v in dynatrace_document.this : k => v.id }
}

output "shared_documents" {
  value = { for k, v in dynatrace_direct_shares.this : k => v.document_id }
}

output "launchpad_statuses" {
  value = { for k, v in dynatrace_default_launchpad.this : k => v.group_launchpads }
}
