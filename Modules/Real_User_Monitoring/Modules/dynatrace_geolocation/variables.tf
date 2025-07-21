variable "geolocation" {
  description = "Controls display of world map and defines the scope for geolocation data."
  type = map(object({
    display_worldmap = bool
    scope            = string
  }))
  default = {
    geo1 = {
      display_worldmap = true
      scope            = "environment"
    }
  }
}