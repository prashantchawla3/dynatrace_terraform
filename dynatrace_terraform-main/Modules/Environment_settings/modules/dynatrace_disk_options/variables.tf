variable "disk_options_resources" {
  description = "Disk monitoring configurations including exclusions and NFS settings."
  type = list(object({
    name     = string
    type     = string
    settings = object({
      disk_options = object({
        disable_nfs_disk_monitoring = bool
        nfs_show_all                = bool
        scope                       = string
        exclusions = list(object({
          filesystem = string
          mountpoint = string
          os         = string
        }))
      })
    })
  }))
  default = []
}
