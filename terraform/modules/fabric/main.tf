# Microsoft Fabric Provider Module

# Get the Fabric Capacity details
data "fabric_capacity" "this" {
  display_name = var.capacity_id

  lifecycle {
    postcondition {
      condition     = self.state == "Active"
      error_message = "Fabric Capacity is not in Active state. Please check the Fabric Capacity status."
    }
  }
}

# Create a Fabric Workspace
resource "fabric_workspace" "this" {
  capacity_id  = data.fabric_capacity.this.id
  display_name = var.workspace_name
  description  = var.description
}
