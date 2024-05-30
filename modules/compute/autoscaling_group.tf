resource "aws_autoscaling_group" "HA_cluster_master_nodes_asg" {
  name                = "HA-Cluster-Master-Node-ASG"
  max_size            = 1
  min_size            = 1
  desired_capacity    = 1
  force_delete        = true
  placement_group     = aws_placement_group.master_node_placement.id
  vpc_zone_identifier = var.HA_cluster_public_subnets_list # list of subnet ids

  launch_template {
    id      = aws_launch_template.master_node_launch_template.id
    version = aws_launch_template.master_node_launch_template.latest_version
  }

}


#   tag {
#     key                 = "Name" #name of EC2 hosts
#     value               = "Bastion-Host-Kubernetes-Cluster"
#     propagate_at_launch = true
#   }

#   timeouts {
#     delete = "15m"
#   }

#   tag {
#     key                 = "lorem"
#     value               = "ipsum"
#     propagate_at_launch = false
#   }
# }
