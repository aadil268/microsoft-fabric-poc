variable "solution_name" {
  description = "Name of the solution, used for resource naming"
  type        = string
  default     = "fabricpoc"
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "West Europe"
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

variable "fabric_capacity_admin_upns" {
  description = "List of additional admin user principal names for Fabric Capacity"
  type        = list(string)
  default     = []
}
