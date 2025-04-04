output "id" {
  description = "The ID of the Fabric workspace"
  value       = fabric_workspace.this.id
}

output "display_name" {
  description = "The display name of the Fabric workspace"
  value       = fabric_workspace.this.display_name
}

output "description" {
  description = "The description of the Fabric workspace"
  value       = fabric_workspace.this.description
}

output "capacity_id" {
  description = "The ID of the Fabric capacity used by the workspace"
  value       = fabric_workspace.this.capacity_id
}

output "capacity_assignment_mode" {
  description = "The capacity assignment mode of the workspace"
  value       = fabric_workspace.this.capacity_assignment_mode
}
