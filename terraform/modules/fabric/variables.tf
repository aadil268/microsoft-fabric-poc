variable "capacity_id" {
  description = "The ID of the Fabric Capacity to use for the workspace"
  type        = string
}

variable "workspace_name" {
  description = "The name of the Fabric workspace"
  type        = string
  default     = "fabric-workspace"
}

variable "description" {
  description = "Description of the Fabric workspace"
  type        = string
  default     = "Workspace created via Terraform"
}

variable "tags" {
  description = "Tags to apply to the workspace"
  type        = map(string)
  default     = {}
}
