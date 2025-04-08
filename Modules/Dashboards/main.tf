module "Management_Zone" {
  source = "../Management_Zone"
  zone_name = "module.Management_Zone.management_zone_id"
  
}

resource "dynatrace_json_dashboard" "example" {
  contents = jsonencode(
    {
      "dashboardMetadata" : {
        "name" : "Example Dashboard",
        "shared" : true,
        "owner" : "owner@example.com",
        "tags" : ["example", "dashboard"],
        "preset" : false
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
                  "metric" : "example.metric",
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
            },
            "managementZone" : module.Management_Zone.management_zone_id  # Embed the management zone filter
          }
        }
      ]
    }
  )
}