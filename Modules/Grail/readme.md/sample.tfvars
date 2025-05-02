api_url = "https://your-dynatrace-api-url"
api_token = "your-dynatrace-api-token"

segments = [
  {
    name        = "K8s Cluster Segment"
    description = "Segment for Kubernetes Cluster"
    is_public   = true
    includes = [
      {
        data_object         = "dt.entity.kubernetes_cluster"
        filter              = jsonencode({"children": [{"key": {"textValue": "k8s.cluster.name"}}]})
        relationship_name   = "clustered_by"
        relationship_target = "dt.entity.kubernetes_node"
      },
      {
        data_object         = "dt.entity.host"
        filter              = ""
        relationship_name   = "belongs_to"
        relationship_target = "dt.entity.kubernetes_cluster"
      }
    ]
  }
]
