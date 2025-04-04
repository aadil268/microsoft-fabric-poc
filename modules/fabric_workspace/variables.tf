variable "capacity_id" {
  description = "The ID of the Fabric Capacity to use for the workspace"
  type        = string
}

variable "display_name" {
  description = "The display name of the Fabric workspace"
  type        = string
}

variable "description" {
  description = "The description of the Fabric workspace"
  type        = string
  default     = "Workspace created via Terraform"
}

variable "capacity_assignment_mode" {
  description = "The capacity assignment mode for the workspace"
  type        = string
  default     = "Shared"
  validation {
    condition     = contains(["Shared", "Dedicated"], var.capacity_assignment_mode)
    error_message = "Valid values for capacity_assignment_mode are Shared and Dedicated."
  }
}
