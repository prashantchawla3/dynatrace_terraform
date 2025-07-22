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