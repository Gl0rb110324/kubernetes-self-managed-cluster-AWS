#creates 3 private and public subnets, each pertaining to 3 AZs within EU-west-2
resource "aws_subnet" "kubernetes_cluster_private_subnets" {
  count             = 3
  vpc_id            = aws_vpc.kubernetes_cluster_vpc.id
  cidr_block        = local.cluster_subnets_list[count.index]
  availability_zone = local.subnet_regions[count.index]
  tags = merge(
    var.required_tags,
    {
      Name = "${var.project_name}-Subnet-Public-${local.subnet_name_notation[count.index]}"
    }
  )
}

resource "aws_subnet" "kubernetes_cluster_public_subnets" {
  count             = 3
  vpc_id            = aws_vpc.kubernetes_cluster_vpc.id
  cidr_block        = local.cluster_subnets_list[count.index + 3]
  availability_zone = local.subnet_regions[count.index]
  tags = merge(
    var.required_tags,
    {
      Name = "${var.project_name}-Subnet-Private-${local.subnet_name_notation[count.index]}"
    }
  )
}
