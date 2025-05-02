
output "session_replay_resource_capture_id" {
  description = "The ID of the session replay resource capture resource"
  value       = dynatrace_session_replay_resource_capture.this.id
}

output "session_replay_web_privacy_id" {
  description = "The ID of the session replay web privacy resource"
  value       = dynatrace_session_replay_web_privacy.this.id
}
