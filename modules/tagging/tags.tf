variable "resource_environment" {
  type        = string
  description = "Environment the resource will exist in, one of: Core, Sandbox, Development or Production"
  validation {
    condition     = contains(["Core", "Sandbox", "Development", "Production"], var.resource_environment)
    error_message = "Must be one of [Core, Sandbox, Development, Production]."
  }
}

variable "service" {
  type        = string
  description = "Used for ease of resource tracking depending on the project"
}

variable "project_name" {
  type        = string
  description = "The name of the project. Used for ClamAV Scan Failure Notification"
}