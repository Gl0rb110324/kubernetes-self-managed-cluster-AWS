output "HA_cluster_public_subnets_ids" {
  value = aws_subnet.kubernetes_cluster_public_subnets[*].id
}
