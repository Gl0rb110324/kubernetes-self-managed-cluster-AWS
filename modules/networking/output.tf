output "HA_cluster_public_subnets_ids" {
  value = aws_subnet.kubernetes_cluster_public_subnets[*].id
}

output "HA_cluster_master_nodes_vpc_id" {
  value = aws_vpc.kubernetes_cluster_vpc.id
}

output "HA_cluster_vpc_cidr" {
  value = local.cluster_vpc_cidr
}
