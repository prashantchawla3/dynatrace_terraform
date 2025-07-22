default_launchpads = {
  example = {
    group_launchpads = [
      {
        is_enabled    = false
        launchpad_id  = "bbfbffa1-3cce-49a9-bc8f-c892c626f034"
        user_group_id = "ed8db894-e13f-43e8-8916-dd30b8e37e92"
      }
    ]
  }
}

documents = {
  dashboard1 = {
    type = "dashboard"
    name = "Example Dashboard"
    content = {
      version = 13
      variables = []
      tiles = {
        "0" = {
          type    = "markdown"
          title   = ""
          content = "!Image of a Dashboard"
        }
        "1" = {
          type  = "data"
          title = ""
          query = "timeseries avg(dt.host.cpu.user)"
          queryConfig = {
            additionalFilters = {}
            version           = "4.3.1"
            datatype          = "metrics"
            metricKey         = "dt.host.cpu.user"
            aggregation       = "avg"
            by                = []
          }
          subType = "dql-builder-metrics"
          visualization = "lineChart"
          visualizationSettings = {
            thresholds = []
            chartSettings = {
              gapPolicy = "connect"
              circleChartSettings = {
                groupingThresholdType = "relative"
                groupingThresholdValue = 0
                valueType = "relative"
              }
              categoryOverrides = {}
              fieldMapping = {
                timestamp = "timeframe"
                leftAxisValues = ["avg(dt.host.cpu.user)"]
                leftAxisDimensions = []
                fields = []
                values = []
              }
            }
            singleValue = {
              showLabel = true
              label = ""
              prefixIcon = ""
              autoscale = true
              alignment = "center"
              colorThresholdTarget = "value"
            }
            table = {
              rowDensity = "condensed"
              enableSparklines = false
              hiddenColumns = []
              lineWrapIds = []
              columnWidths = {}
            }
          }
        }
      }
      layouts = {
        "0" = { x = 0, y = 0, w = 24, h = 14 }
        "1" = { x = 0, y = 14, w = 9, h = 6 }
        "2" = { x = 15, y = 14, w = 9, h = 6 }
      }
    }
  }
}

direct_shares = {
  share1 = {
    document_key = "dashboard1"
    access       = "read-write"
    recipients = [
      { id = "441664f0-23c9-40ef-b344-18c02c23d787", type = "user" },
      { id = "441664f0-23c9-40ef-b344-18c02c23d788", type = "group" }
    ]
  }
}
