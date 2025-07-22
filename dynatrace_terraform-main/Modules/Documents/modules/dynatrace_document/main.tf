resource "dynatrace_document" "this" {
  for_each = var.documents

  type    = each.value.type
  name    = each.value.name
  content = jsonencode(each.value.content)
}
