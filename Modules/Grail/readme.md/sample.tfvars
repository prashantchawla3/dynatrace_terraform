segment_name        = "example-segment"
segment_description = "Example description"
segment_is_public   = true

segment_query = <<-EOT
  fetch dt.entity.kubernetes_cluster
  | fields cluster = entity.name
  | sort cluster
EOT

includes_items = [
  {
    data_object = "_all_data_object"
    filter = <<EOT
{
  "children": [
    {
      "key": {
        "range": { "from": 0, "to": 16 },
        "textValue": "k8s.cluster.name",
        "type": "Key",
        "value": "k8s.cluster.name"
      },
      "operator": {
        "range": { "from": 17, "to": 18 },
        "textValue": "=",
        "type": "ComparisonOperator",
        "value": "="
      },
      "range": { "from": 0, "to": 27 },
      "type": "Statement",
      "value": {
        "range": { "from": 19, "to": 27 },
        "textValue": "$cluster",
        "type": "String",
        "value": "$cluster"
      }
    }
  ],
  "explicit": false,
  "logicalOperator": "AND",
  "range": { "from": 0, "to": 27 },
  "type": "Group"
}
EOT
    relationship = null
  },
  {
    data_object = "dt.entity.cloud_application"
    filter      = ""
    relationship = {
      name   = "clustered_by"
      target = "dt.entity.kubernetes_cluster"
    }
  },
  {
    data_object = "dt.entity.cloud_application_instance"
    filter      = ""
    relationship = {
      name   = "clustered_by"
      target = "dt.entity.kubernetes_cluster"
    }
  },
  {
    data_object = "dt.entity.cloud_application_namespace"
    filter      = ""
    relationship = {
      name   = "clustered_by"
      target = "dt.entity.kubernetes_cluster"
    }
  },
  {
    data_object = "dt.entity.container_group_instance"
    filter      = ""
    relationship = {
      name   = "belongs_to"
      target = "dt.entity.kubernetes_cluster"
    }
  },
  {
    data_object = "dt.entity.host"
    filter      = ""
    relationship = {
      name   = "clustered_by"
      target = "dt.entity.kubernetes_cluster"
    }
  },
  {
    data_object = "dt.entity.kubernetes_cluster"
    filter = <<EOT
{
  "children": [
    {
      "key": {
        "range": { "from": 0, "to": 11 },
        "textValue": "entity.name",
        "type": "Key",
        "value": "entity.name"
      },
      "operator": {
        "range": { "from": 12, "to": 13 },
        "textValue": "=",
        "type": "ComparisonOperator",
        "value": "="
      },
      "range": { "from": 0, "to": 22 },
      "type": "Statement",
      "value": {
        "range": { "from": 14, "to": 22 },
        "textValue": "$cluster",
        "type": "String",
        "value": "$cluster"
      }
    }
  ],
  "explicit": false,
  "logicalOperator": "AND",
  "range": { "from": 0, "to": 22 },
  "type": "Group"
}
EOT
    relationship = null
  },
  {
    data_object = "dt.entity.kubernetes_node"
    filter      = ""
    relationship = {
      name   = "clustered_by"
      target = "dt.entity.kubernetes_cluster"
    }
  },
  {
    data_object = "dt.entity.kubernetes_service"
    filter      = ""
    relationship = {
      name   = "clustered_by"
      target = "dt.entity.kubernetes_cluster"
    }
  },
  {
    data_object = "dt.entity.service"
    filter      = ""
    relationship = {
      name   = "clustered_by"
      target = "dt.entity.kubernetes_cluster"
    }
  }
]
