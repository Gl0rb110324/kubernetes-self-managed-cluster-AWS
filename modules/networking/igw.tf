resource "aws_internet_gateway" "HA_vpc_internet_gateway" {
  vpc_id = aws_vpc.kubernetes_cluster_vpc.id

  tags = {
    Name = "HA-Kubernetes-Cluster-IGW"
  }
}

