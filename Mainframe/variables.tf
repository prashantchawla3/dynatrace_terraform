variable "cics_mq_queue_id_includes" {
  type        = list(string)
  default     = ["CICS.INCLUDE.QUEUE1", "CICS.INCLUDE.QUEUE2"]
}

variable "cics_mq_queue_id_excludes" {
  type        = list(string)
  default     = ["CICS.EXCLUDE.QUEUE1"]
}

variable "ims_mq_queue_id_excludes" {
  type        = list(string)
  default     = ["IMS.EXCLUDE.QUEUE1"]
}

variable "ims_cr_trn_id_includes" {
  type        = list(string)
  default     = ["IMS.TRN.START", "IMS.TRN.END"]
}

variable "ims_bridge_name" {
  type        = string
  default     = "IMS-BRIDGE-CORE"
}

variable "ims_queue_managers" {
  type = map(object({
    name               = string
    queue_manager_queue = optional(list(string))
  }))
  default = {
    qmgr1 = {
      name                 = "QMGR-IMS-01"
      queue_manager_queue  = ["IMS.QUEUE1", "IMS.QUEUE2"]
    }
    qmgr2 = {
      name = "QMGR-IMS-02"
    }
  }
}

variable "group_cics_regions" {
  type    = bool
  default = true
}

variable "group_ims_regions" {
  type    = bool
  default = false
}

variable "monitor_all_ctg_protocols" {
  type    = bool
  default = true
}

variable "monitor_all_incoming_web_requests" {
  type    = bool
  default = true
}

variable "node_limit" {
  type    = number
  default = 2500
}

variable "zos_cics_service_detection_uses_transaction_id" {
  type    = bool
  default = true
}

variable "zos_ims_service_detection_uses_transaction_id" {
  type    = bool
  default = true
}

variable "queue_manager_name" {
  type    = string
  default = "QMGR-CORE"
}

variable "queue_manager_clusters" {
  type    = list(string)
  default = ["CLUSTER1", "CLUSTER2"]
}

variable "alias_queues" {
  type = map(object({
    alias_queue_name   = string
    base_queue_name    = string
    cluster_visibility = optional(list(string))
  }))
  default = {
    alias1 = {
      alias_queue_name   = "ALIAS.ORDER.REQ"
      base_queue_name    = "BASE.ORDER.REQ"
      cluster_visibility = ["CLUSTER1"]
    }
    alias2 = {
      alias_queue_name = "ALIAS.PAYMENT.REQ"
      base_queue_name  = "BASE.PAYMENT.REQ"
    }
  }
}

variable "remote_queues" {
  type = map(object({
    local_queue_name     = string
    remote_queue_name    = string
    remote_queue_manager = string
    cluster_visibility   = optional(list(string))
  }))
  default = {
    remote1 = {
      local_queue_name     = "LOCAL.ORDER.OUT"
      remote_queue_name    = "REMOTE.ORDER.IN"
      remote_queue_manager = "QMGR-REMOTE-01"
      cluster_visibility   = ["CLUSTER1"]
    }
  }
}

variable "cluster_queues" {
  type = map(object({
    local_queue_name   = string
    cluster_visibility = optional(list(string))
  }))
  default = {
    cq1 = {
      local_queue_name   = "CLUSTER.SALES.DATA"
      cluster_visibility = ["CLUSTER1"]
    }
    cq2 = {
      local_queue_name = "CLUSTER.BILLING.DATA"
    }
  }
}

variable "queue_sharing_group_name" {
  type    = string
  default = "QSG-MAIN"
}

variable "queue_sharing_group_managers" {
  type    = list(string)
  default = ["QMGR-SHARE-01", "QMGR-SHARE-02"]
}

variable "queue_sharing_group_shared_queues" {
  type    = list(string)
  default = ["SHARED.QUEUE1", "SHARED.QUEUE2"]
}

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
