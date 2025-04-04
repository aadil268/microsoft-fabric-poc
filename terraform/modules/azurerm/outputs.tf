output "fabric_capacity_id" {
  description = "The ID of the created Fabric Capacity"
  value       = azurerm_fabric_capacity.this.id
}

output "fabric_capacity_name" {
  description = "The name of the created Fabric Capacity"
  value       = azurerm_fabric_capacity.this.name
}

output "resource_group_name" {
  description = "The name of the resource group containing the Fabric Capacity"
  value       = local.resource_group_name
}

output "location" {
  description = "The location of the Fabric Capacity"
  value       = azurerm_fabric_capacity.this.location
}

output "admin_members" {
  description = "The administrator members of the Fabric Capacity"
  value       = azurerm_fabric_capacity.this.administration_members
}

output "sku" {
  description = "The SKU of the Fabric Capacity"
  value       = "${azurerm_fabric_capacity.this.sku[0].name} (${azurerm_fabric_capacity.this.sku[0].tier})"
}
