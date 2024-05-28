# resource "aws_ecr_repository" "ecr_repo" {
#   name                 = local.ecr_repo_name
#   image_tag_mutability = "MUTABLE"

#   encryption_configuration {

#   }

#   image_scanning_configuration {
#     scan_on_push = true
#   }

#   tags = merge(
#     var.required_tags,
#     {
#     }
#   )
#   provisioner "local-exec" { #log into ecr, tag local nginx and push to ECR repository
#     command = <<EOT
#       "aws ecr get-login-password --region ${data.aws_region.current.name} --profile  | docker login --username AWS --password-stdin ${data.aws_caller_identity.current.id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com"
#       "docker tag nginx ${data.aws_caller_identity.current.id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/${local.ecr_repo_name}:latest"
#       "docker push ${data.aws_caller_identity.current.id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/${local.ecr_repo_name}:latest"
#     EOT
#   }
#   lifecycle {
#     prevent_destroy = true
#   }
# }

