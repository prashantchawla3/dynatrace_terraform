resource "dynatrace_transaction_start_filters" "transaction_start_filters" {
  cics_terminal_transaction_ids = var.cics_terminal_transaction_ids
  cics_transaction_ids          = var.cics_transaction_ids
  ims_transaction_ids           = var.ims_transaction_ids
  ims_terminal_transaction_ids  = var.ims_terminal_transaction_ids
}