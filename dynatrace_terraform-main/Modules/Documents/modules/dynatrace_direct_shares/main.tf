resource "dynatrace_direct_shares" "this" {
  for_each = var.direct_shares

  document_id = dynatrace_document.this[each.value.document_key].id
  access      = each.value.access

  recipients {
    dynamic "recipient" {
      for_each = each.value.recipients
      content {
        id   = recipient.value.id
        type = recipient.value.type
      }
    }
  }
}
