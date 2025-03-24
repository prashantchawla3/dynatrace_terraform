resource "dynatrace_json_dashboard" "example" {
  contents = jsonencode(
    {
      "dashboardMetadata" : {
        "name" : var.dashboard_name,
        "shared" : var.dashboard_shared,
        "owner" : var.dashboard_owner,
        "tags" : var.dashboard_tags,
        "preset" : var.dashboard_preset
      },
      "tiles" : [
        {
          "name" : "Custom chart",
          "tileType" : "CUSTOM_CHARTING",
          "configured" : true,
          "bounds" : {
            "top" : 0,
            "left" : 0,
            "width" : 342,
            "height" : 304
          },
          "filterConfig" : {
            "type" : "MIXED",
            "customName" : "Example Chart",
            "defaultName" : "Custom chart",
            "chartConfig" : {
              "legendShown" : true,
              "type" : "TIMESERIES",
              "series" : [
                {
                  "metric" : var.metric_name,
                  "aggregation" : "SUM",
                  "type" : "LINE",
                  "entityType" : "IOT",
                  "dimensions" : [
                    {
                      "id" : "0",
                      "name" : "dt.entity.custom_device",
                      "entityDimension" : true
                    }
                  ],
                  "sortColumn" : true,
                  "aggregationRate" : "TOTAL"
                }
              ]
            }
          }
        }
      ]
    }
  )
}