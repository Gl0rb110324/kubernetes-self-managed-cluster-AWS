variable "project_name" {
  type = string
}
variable "required_tags" {
  type        = map(any)
  description = "required tags associated with the project"
}
