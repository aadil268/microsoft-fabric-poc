variable "name" {
  description = "The name of the Fabric Capacity"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Fabric Capacity"
  type        = string
}

variable "location" {
  description = "The Azure region where the Fabric Capacity should be created"
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the Fabric Capacity"
  type        = string
  validation {
    condition     = contains(["F2", "F4", "F8", "F16", "F32", "F64", "F128", "F256", "F512", "F1024", "F2048"], var.sku_name)
    error_message = "Valid values for sku_name are F2, F4, F8, F16, F32, F64, F128, F256, F512, F1024, F2048."
  }
}

variable "administration_members" {
  description = "List of administrator user identities (UPNs for users, object IDs for service principals)"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
