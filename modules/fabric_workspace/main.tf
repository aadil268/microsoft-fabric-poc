/**
 * # Fabric Workspace Module
 * 
 * This module creates a Microsoft Fabric Workspace using the Microsoft Fabric provider.
 * 
 * ## Usage
 * ```hcl
 * module "fabric_workspace" {
 *   source = "path/to/modules/fabric_workspace"
 *   
 *   capacity_id            = module.fabric_capacity.id
 *   display_name           = "example-workspace"
 *   description            = "Example Fabric workspace"
 *   capacity_assignment_mode = "Shared"
 * }
 * ```
 */

# Create a Fabric Workspace
resource "fabric_workspace" "this" {
  capacity_id            = var.capacity_id
  display_name           = var.display_name
  description            = var.description
  capacity_assignment_mode = var.capacity_assignment_mode
}
