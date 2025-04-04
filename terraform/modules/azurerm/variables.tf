variable "solution_name" {
  description = "Name of the solution, used for resource naming"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "Name of the resource group to create or use"
  type        = string
  default     = ""
}

variable "fabric_capacity_sku" {
  description = "SKU for the Fabric Capacity"
  type        = string
  default     = "F2"
  validation {
    condition     = contains(["F2", "F4", "F8", "F16", "F32", "F64", "F128", "F256", "F512", "F1024", "F2048"], var.fabric_capacity_sku)
    error_message = "Valid values for fabric_capacity_sku are F2, F4, F8, F16, F32, F64, F128, F256, F512, F1024, F2048."
  }
}

variable "admin_members" {
  description = "List of administrator user identities (UPNs for users, object IDs for service principals)"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}
}
