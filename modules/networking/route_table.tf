resource "aws_default_route_table" "kubernetes_cluster_default_route_table" {
  default_route_table_id = aws_vpc.kubernetes_cluster_vpc.default_route_table_id


  tags = merge(var.required_tags,
    {
      Name = "${var.project_name}-Default-Route-Table"
    }
  )
}

resource "aws_route_table" "kubernetes_cluster_public_route_table" {
  vpc_id = aws_vpc.kubernetes_cluster_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.HA_vpc_internet_gateway.id
  }
  tags = merge(var.required_tags,
    {
      Name = "${var.project_name}-Public-Route-Table"
    }
  )
}

resource "aws_route_table_association" "kubernetes_cluster_public_route_table_associations" {
  count          = 3
  subnet_id      = aws_subnet.kubernetes_cluster_public_subnets[count.index].id
  route_table_id = aws_route_table.kubernetes_cluster_public_route_table.id
}

# #####
resource "aws_route_table" "kubernetes_cluster_private_route_table" {
  vpc_id = aws_vpc.kubernetes_cluster_vpc.id


  tags = merge(var.required_tags,
    {
      Name = "${var.project_name}-private-route-table"
    }
  )
}

resource "aws_route_table_association" "kubernetes_cluster_private_route_table_associations" {
  count          = 3
  subnet_id      = aws_subnet.kubernetes_cluster_private_subnets[count.index].id
  route_table_id = aws_route_table.kubernetes_cluster_private_route_table.id
}
