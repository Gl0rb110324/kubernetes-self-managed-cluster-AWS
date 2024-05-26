resource "aws_vpc" "kubernetes_cluster_vpc" {
  cidr_block = local.cluster_vpc_cidr
  tags = merge(
    var.required_tags,
    {
      Name = "${var.project_name}-VPC"
    }
  )
  enable_dns_hostnames = true
  enable_dns_support   = true
}
