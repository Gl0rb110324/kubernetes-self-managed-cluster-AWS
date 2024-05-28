resource "aws_autoscaling_group" "HA_cluster_bastion_host_asg" {
  name                = "Bastion-Host-HA-Cluster-ASG"
  max_size            = 1
  min_size            = 1
  desired_capacity    = 1
  force_delete        = true
  placement_group     = aws_placement_group.bastion_host_placement.id
  vpc_zone_identifier = var.HA_cluster_public_subnets_list

  launch_template {
    id      = aws_launch_template.bastion_host_launch_template.id
    version = aws_launch_template.bastion_host_launch_template.latest_version
  }

  initial_lifecycle_hook {
    #These hooks let you create solutions that are aware of events in the Auto Scaling instance lifecycle,
    #and then perform a custom action on instances when the corresponding lifecycle event occurs.
    name                 = "initial-lifecycle-hook"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 2000
    lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"

    notification_metadata = jsonencode({
      foo = "bar"
    })

    # notification_target_arn = "arn:aws:sqs:us-east-1:444455556666:queue1*" examp le send hook to SNS queue
    # role_arn                = "arn:aws:iam::123456789012:role/S3Access"

  }


  tag {
    key                 = "Name" #name of EC2 hosts
    value               = "Bastion-Host-Kubernetes-Cluster"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "lorem"
    value               = "ipsum"
    propagate_at_launch = false
  }
}
