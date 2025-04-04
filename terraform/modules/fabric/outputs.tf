output "workspace_id" {
  description = "The ID of the created Fabric workspace"
  value       = fabric_workspace.this.id
}

output "workspace_name" {
  description = "The name of the created Fabric workspace"
  value       = fabric_workspace.this.display_name
}

output "capacity_id" {
  description = "The ID of the Fabric capacity used"
  value       = data.fabric_capacity.this.id
}

output "capacity_state" {
  description = "The state of the Fabric capacity"
  value       = data.fabric_capacity.this.state
}
