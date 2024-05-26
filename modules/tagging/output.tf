output "required_tags" {
  value = tomap({
    "resource:environment" = var.resource_environment,
    "project:name"         = var.project_name
  })
  description = "Returns a map of all enforced/required tags for all resources in AWS"
}

output "project_name" {
  value       = var.project_name
  description = "The name of the project."
}