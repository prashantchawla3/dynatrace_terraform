variable "cics_terminal_transaction_ids" {
  type    = list(string)
  default = ["TERM.CICS.TRN01", "TERM.CICS.TRN02"]
}

variable "cics_transaction_ids" {
  type    = list(string)
  default = ["CICS.TRN.A01", "CICS.TRN.B01"]
}

variable "ims_transaction_ids" {
  type    = list(string)
  default = ["IMS.TRN.ENTRY", "IMS.TRN.EXIT"]
}

variable "ims_terminal_transaction_ids" {
  type    = list(string)
  default = ["TERM.IMSTRN.A", "TERM.IMSTRN.B"]
}
