# Create a security group for the EC2 instance
resource "aws_security_group" "master_nodes_instances_sg" {
  name_prefix = "node-instance-sg"
  vpc_id      = var.HA_cluster_master_nodes_vpc_id
  description = "security group for the EC2  nodes"

  # Allow outbound HTTPS traffic
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS outbound traffic"
  }

  tags = {
    Name = "HA-Cluster-Instance-SG"
  }
}

# Security group for VPC Endpoints
resource "aws_security_group" "vpc_endpoint_security_group" {
  name_prefix = "vpc-endpoint-sg"
  vpc_id      = var.HA_cluster_master_nodes_vpc_id
  description = "security group for VPC Endpoints ingress to HA cluster"

  # Allow inbound HTTPS traffic
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.HA_cluster_vpc_cidr]
    description = "Allow HTTPS traffic from VPC"
  }

  tags = {
    Name = "VPC Endpoint security group"
  }
}
