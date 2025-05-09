output "disk_anomalies_ids" {
  description = "IDs of the created Dynatrace disk anomalies"
  value = {
    for key, resource in dynatrace_disk_anomalies_v2.this :
    key => resource.id
  }
}
