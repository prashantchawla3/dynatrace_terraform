output "team_id" {
  description = "The ID of the created team"
  value       = dynatrace_ownership_teams.example_team.id
}

output "team_name" {
  description = "The name of the created team"
  value       = dynatrace_ownership_teams.example_team.name
}