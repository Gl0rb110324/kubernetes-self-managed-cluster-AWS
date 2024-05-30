resource "aws_vpc_endpoint" "endpoints" {
  vpc_id            = aws_vpc.kubernetes_cluster_vpc.id
  for_each          = local.endpoints
  vpc_endpoint_type = "Interface"
  service_name      = "com.amazonaws.${data.aws_region.current.name}.${each.value.name}"
  # Add a security group to the VPC endpoint
  # security_group_ids = [aws_security_group.vpc_endpoint_security_group.id]
}
